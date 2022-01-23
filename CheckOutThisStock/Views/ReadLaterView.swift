//
//  ReadLaterView.swift
//  StockData
//
//  Created by MAC on 14/11/2021.
//

import SwiftUI
//import Firebase

struct ReadLaterView: View {
    @ObservedObject var read = ReadLaterManager()
    
    var body: some View {
        
        
        if(read.readLater.count > 0) {
            
            ScrollView {
                ForEach(read.readLater.sorted(), id: \.self) { index in
                    
                    
                    
                    NavigationLink(
                        destination: WebView(urlString: index.article_url))
                    {
                        
                        
                        
                        
                        VStack(alignment: .leading) {
                            
                            
                            Text(index.name)
                                .foregroundColor(Color("BlackAndWhite"))
                                .padding(.horizontal, 10)
                                .font(.system(size:25))
                            
                            Image(systemName: "person.fill")
                                .data(url: URL(string: index.image_url)!)
                                .resizable()
                                
                                .aspectRatio(contentMode: .fit)
                                
                                .padding(.bottom, 5)
                            
                            
                            Text(index.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color("BlackAndWhite"))
                                .shadow(color: .white, radius: 0, x: 0.0, y: 0.0)
                                .padding(.horizontal, 10)
                            
                            
                            Text(index.author)
                                .foregroundColor(Color("BlackAndWhite"))
                                .padding(.horizontal, 10)
                                .padding(.bottom, 10)
                                .font(.system(size:15))
                                .shadow(color: .white, radius: 0, x: 0.0, y: 0.0)
                            
                        }
                        
                        
                        
                        
                        
                        
                    }
                    
                    .contextMenu {
                        Button ( action: {
                            
                            read.deleteRead(id: index.id)
                        }) {
                            Label("Remove from reading list", systemImage: "remove")
                        }
                    }
                    
                    
                }
            }
            
            
        } else {
            LoadingView()
        }
    }
    
}

struct ReadLaterView_Previews: PreviewProvider {
    static var previews: some View {
        ReadLaterView()
    }
}
