//
//  StockListManager.swift
//  StockData
//
//  Created by MAC on 15/11/2021.
//

import Foundation

class StockListManager: ObservableObject {
    @Published var stockListData = [Stocks]()
    
    init() {
        
        self.loadStockData()
        
    }
    func loadStockData() {
        
        if let url = Bundle.main.url(forResource: "tickerAndCompany", withExtension: "json") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if(error == nil) {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Result.self, from: safeData)
                            DispatchQueue.main.async {
                                self.stockListData = results.stocks
                                
                            }
                        } catch {
                            print(error)
                        }
                        
                    }
                }
            }
            task.resume()
        }
        
    }
}
