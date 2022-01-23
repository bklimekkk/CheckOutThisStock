//
//  StockInformationsView.swift
//  newProject
//
//  Created by MAC on 15/11/2021.
//

import Foundation
import UIKit
import SwiftUI
//import SVGKit

struct StockInformationsView: View {
    
    @ObservedObject var stockDataManager = StockDataManager()
    
    //watchlist initialized
    @ObservedObject var watchlist = WatchlistManager()
    @ObservedObject var readLater = ReadLaterManager()
    
    @State var existsInWatchlist = false
    @State var alreadyExists = false
    
    
    //variables responsible for popover popping up
    @State var similarStock: SimilarStocks? = nil
    @State var article: Results? = nil
    
    
    let ticker: String
    let company: String
    
    fileprivate func findID(watchlist: WatchlistManager, id: inout String) {
        for item in watchlist.watchlist {
            if(item.ticker == ticker) {
                id = item.id
            }
        }
    }
    
    var body: some View {
        
        VStack {
            
            if(stockDataManager.stock.stockImage == ""
                || stockDataManager.stock.stockPrice == ""
                || stockDataManager.stock.stockCEO == "") {
                LoadingView()
            } else {
                ScrollView {
                    
                    
                    VStack(alignment: .leading) {
                        HStack {
                            
                            if(stockDataManager.stock.stockImage != "") {
                                
                                Image(systemName: "person.fill")
                                    .data(url: URL(string: stockDataManager.stock.stockImage)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(10)
                                
                            } else {
                                
                            }
                            
                            VStack(alignment: .leading) {
                                Text(ticker)
                                    .font(.system(size:40))
                                Text(stockDataManager.stock.exchange)
                            }
                            .font(.system(size: 12))
                            .padding(.horizontal, 10)
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                ButtonView(buttonName: "Stocks", color: Color("BrightAndDark"), fontSize: 15, width: 75, height: 40)
                                
                            }
                            
                            
                        }
                        
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(stockDataManager.stock.stockPrice)$")
                                    .font(.system(size:40))
                                Text(stockDataManager.stock.stockMarketCap)
                                    .padding(.bottom, 10)
                                    .font(.system(size:30))
                                    .foregroundColor(Color("BlackAndGray"))
                                
                            }
                            
                            Spacer()
                            
                            if(!existsInWatchlist) {
                                Button(action: {
                                    watchlist.addData(ticker: ticker, company: company, image: "https://s3.polygon.io/logos/\(ticker.lowercased())/logo.png")
                                    existsInWatchlist = true
                                }) {
                                    
                                    VStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 50))
                                        
                                        Text("Watchlist")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 20))
                                    }
                                }
                                
                            } else {
                                Button(action: {
                                    var id: String = ""
                                    findID(watchlist: watchlist, id: &id)
                                    watchlist.deleteData(id: id)
                                    existsInWatchlist = false
                                }) {
                                    
                                    VStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                            .font(.system(size: 50))
                                        
                                        Text("Watchlist")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 20))
                                    }
                                }
                            }
                            
                            
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("BrightAndDark"))
                                .shadow(color: Color("ShadowColor"), radius: 5, x: 0.0, y: 0.0)
                                .frame(height:190)
                            
                            ScrollView {
                                VStack (alignment: .leading) {
                                    
                                    Text(stockDataManager.stock.stockCEO)
                                        .font(.system(size:25))
                                        .padding(.horizontal, 15)
                                        .padding(.top, 5)
                                        .padding(.bottom, 5)
                                    
                                    Text(stockDataManager.stock.stockDescription)
                                        .padding(.horizontal, 15)
                                        .padding(.bottom, 15)
                                    
                                }
                            }
                            .frame(height:160)
                            
                        }
                        
                        HStack {
                            Button(action:{}) {
                                ButtonView(buttonName: "Watchlist", color: Color("BrightAndDark"), fontSize: 15, width: 175, height: 60)
                            }
                            
                            Spacer()
                            
                            Button(action:{}) {
                                ButtonView(buttonName: "Readlist", color: Color("BrightAndDark"), fontSize: 15, width: 175, height: 60)
                            }
                        }
                        .padding(.bottom, 10)
                        
                        
                        Text("Similar stocks")
                            .font(.system(size:30))
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                
                                
                                
                                
                                
                                ForEach(stockDataManager.stock.similar) {
                                    index in
                                    
                                    Button(action:{
                                        similarStock = index
                                        
                                    }) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("BrightAndDark"))
                                                .frame(width: 100, height: 100, alignment: .center)
                                            Text(String(index.id))
                                                .foregroundColor(Color("BlackAndWhite"))
                                                .padding(10)
                                        }
                                    }
                                    
                                    .popover(item: $similarStock) {chosenItem in
                                        StockInformationsView(similarStock: nil, ticker: chosenItem.id, company: chosenItem.company)
                                        
                                    }
                                    
                                    
                                    
                                }
                                
                                
                                
                            }
                            
                        }
                        .padding(.bottom, 10)
                        .cornerRadius(10)
                        .shadow(color: Color("ShadowColor"), radius: 5, x: 0.0, y: 0.0)
                        
                        Text("News")
                            .font(.system(size:30))
                            .padding(.bottom, 10)
                        
                        
                        
                        VStack(alignment: .leading) {
                            
                            ForEach(stockDataManager.stock.results, id: \.self) { index in
                                
                                Button(action:{
                                    article = index
                                })
                                {
                                    VStack(alignment: .leading) {
                                        
                                        Text(index.publisher.name)
                                            .foregroundColor(Color("BlackAndWhite"))
                                            .font(.system(size:25))
                                        
                                        Image(systemName: "person.fill")
                                            .data(url: URL(string: index.image_url)!)
                                            .resizable()
                                            
                                            .aspectRatio(contentMode: .fit)
                                            .padding(.bottom, 5)
                                        
                                        
                                        Text(index.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("BlackAndWhite"))
                                            .shadow(color: Color("BlackAndWhite"), radius: 0, x: 0.0, y: 0.0)
                                            .padding(.horizontal, 5)
                                        
                                        
                                        Text(index.author)
                                            .foregroundColor(Color("BlackAndGray"))
                                            .padding(.horizontal, 5)
                                            .padding(.bottom, 10)
                                            .font(.system(size:15))
                                            .shadow(color: .white, radius: 0, x: 0.0, y: 0.0)
                                        
                                    }
                                }
                                
                                .popover(item: $article) {chosenItem in
                                    WebView(urlString: chosenItem.article_url)
                                    
                                }
                                .contextMenu {
                                    Button ( action: {
                                        readLater.getRead()
                                        
                                        for read in readLater.readLater {
                                            if(read.title == index.title) {
                                                alreadyExists = true
                                            }
                                        }
                                        if(!alreadyExists) {
                                            readLater.addRead(title: index.title, author: index.author, image_url: index.image_url, article_url: index.article_url, name: index.publisher.name, logo_url: index.publisher.logo_url)
                                        }
                                        
                                    }
                                    ) {
                                        Label("Add to Readlist", systemImage: "remove")
                                    }
                                }
                                
                                
                                .alert(isPresented: $alreadyExists) {
                                    Alert(
                                        title: Text("Already exists"),
                                        message: Text("You can't add the article because it already exists in your rading list"),
                                        dismissButton: .default(Text("Ok"))
                                    )
                                    
                                }
                                
                            }
                        }
                    }
                    
                    .padding(.horizontal, 20)
                    .padding(.top, 5)
                    
                } .navigationTitle(company)
            }
        }
        .onAppear() {
            print(company)
            
//            watchlist.getWatchlist()
            
            
            //code I have problem with
            if(watchlist.watchlist.isEmpty) {
                print("Watchlist is empty")
            } else {
                for item in watchlist.watchlist {
                    print(item.company)
                    if(item.company == company) {
                        existsInWatchlist = true
                    }
                }
                
                
                
                
                
            }
            
            stockDataManager.fetchStock(ticker: ticker, stockFullURL: "https://api.polygon.io/v1/meta/symbols/\(ticker)/company?apiKey=0CCshIuYt4lhLkcpbyAPCwD22ieVBOTu", stockPriceURL: "https://api.polygon.io/v2/aggs/ticker/\(ticker)/prev?adjusted=true&apiKey=0CCshIuYt4lhLkcpbyAPCwD22ieVBOTu", stockNewsURL:"https://api.polygon.io/v2/reference/news?ticker=\(ticker)&apiKey=0CCshIuYt4lhLkcpbyAPCwD22ieVBOTu")
            
            
            
            
        }
    }
}

extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data) ?? UIImage())
            
        }
        return self
        
    }
}


//struct SVGImageView: UIViewRepresentable {
//
//
//    var url:URL
//    var size:CGSize
//
//    func updateUIView(_ uiView: SVGKFastImageView, context: Context) {
//        uiView.contentMode = .scaleAspectFit
//        uiView.image.size = size
//    }
//
//    func makeUIView(context: Context) -> SVGKFastImageView {
//        let svgImage = SVGKImage(contentsOf: url)
//        return SVGKFastImageView(svgkImage: svgImage ?? SVGKImage())
//    }
//}

struct ButtonView: View {
    let buttonName: String
    let color: Color
    let fontSize: Int
    let width: Int
    let height: Int
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(color)
                .shadow(color: Color("ShadowColor"), radius: 5, x: 0.0, y: 0.0)
                .frame(width: CGFloat(width), height: CGFloat(height))
            
            Text(buttonName)
                .foregroundColor(Color("BlackAndWhite"))
                .font(.system(size: CGFloat(fontSize)))
                .multilineTextAlignment(.center)
        }
    }
}
