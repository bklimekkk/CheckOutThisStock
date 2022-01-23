//
//  WatchlistView.swift
//  StockData
//
//  Created by MAC on 14/11/2021.
//

import SwiftUI
//import Firebase

struct WatchlistView: View {
    @ObservedObject var watchlist = WatchlistManager()
    
    var body: some View {
        if(watchlist.watchlist.count > 0) {
            List(watchlist.watchlist.sorted()) { item in
                HStack {
                    NavigationLink(
                        destination: StockInformationsView(similarStock: nil, ticker:item.ticker, company:item.company),
                        label: {
                            Image(systemName: "person.fill")
                                .data(url: URL(string: item.image)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .cornerRadius(10)
                            Text(item.company)
                                .fontWeight(.bold)
                                .padding(.horizontal, 10)
                        })
                }
                    .contextMenu {
                    Button {
                        watchlist.deleteData(id: item.id)
                    } label: {
                        Label("Remove from Watchlist", systemImage: "remove")
                    }
                }
            }
        } else {
            LoadingView()
        }
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistView()
    }
}

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(1)
    }
}
