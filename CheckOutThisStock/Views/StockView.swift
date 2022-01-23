//
//  StockView.swift
//  StockData
//
//  Created by MAC on 14/11/2021.
//

import SwiftUI

struct StockView: View {
    
    @ObservedObject var stockListManager = StockListManager()
    
    @State var searchText = ""
    var body: some View {
        VStack {
            
            SearchField(text: $searchText)
            
            List (stockListManager.stockListData.filter({(stock: Stocks) -> Bool in
                return stock.ticker.hasPrefix(searchText.uppercased()) || searchText == ""
            }), id: \.self) { stock in
                NavigationLink(
                    destination: StockInformationsView(similarStock: nil, ticker: stock.ticker, company: stock.company))
                {
                    HStack {
                        Text(stock.ticker)
                        Spacer()
                        Text(stock.company)
                    }
                } .isDetailLink(false)
            }
        }
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView()
    }
}
