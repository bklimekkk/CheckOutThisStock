//
//  SearchStocksView.swift
//  StockData
//
//  Created by MAC on 14/11/2021.
//

import SwiftUI

enum Tabs: String {
    case stocks
    case watchlist
    case readLater
}
struct SearchStocksView: View {
    @State var tab: Tabs = .stocks
    var body: some View {
        TabView (selection: $tab) {
            StockView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Stocks")
                }
                .tag(Tabs.stocks)
            
            WatchlistView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Watchlist")
                }
                .tag(Tabs.watchlist)
            
            ReadLaterView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Read later")
                }
                .tag(Tabs.readLater)
            
        } .navigationTitle(tab.rawValue.capitalized)
    }
}

struct SearchStocksView_Previews: PreviewProvider {
    static var previews: some View {
        SearchStocksView()
    }
}
