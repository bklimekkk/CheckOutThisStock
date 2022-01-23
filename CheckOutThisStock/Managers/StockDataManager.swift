//
//  StockDataManger.swift
//  newProject
//
//  Created by MAC on 16/11/2021.
//

import Foundation
import UIKit

class StockDataManager: ObservableObject {
    var stockListData = StockListManager()
    
    @Published var stock = Stock(stockName: "", stockPrice: "", stockTicker: "", stockImage: "", stockDescription: "", stockMarketCap: "", stockCEO: "", exchange: "", similar:[SimilarStocks](), results:[])
    
    func fetchStock(ticker: String, stockFullURL: String, stockPriceURL: String, stockNewsURL: String) {
        
        if let url = URL(string: stockFullURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {data, response, error in
                if error != nil {
                    
                }
                
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(StockData.self, from: safeData)
                        DispatchQueue.main.async {
                            self.stock.stockName = decodedData.name
                            self.stock.stockTicker = decodedData.symbol
                            self.stock.stockDescription = decodedData.description
                            self.stock.exchange = decodedData.exchange
                            var allSimilarStocks = decodedData.similar
                            
                            for stock in self.stockListData.stockListData {
                                if(allSimilarStocks.contains(stock.ticker)) {
                                    var contains: Bool = false
                                    for item in self.stock.similar {
                                        if item.id == stock.ticker {
                                            contains = true
                                        }
                                    }
                                    if(!contains) {
                                        self.stock.similar.append(SimilarStocks(id: stock.ticker, company: stock.company))
                                    }
                                }
                            }
                            
                            
                            self.stock.stockMarketCap = self.calculateMarketCap(marketCap: decodedData.marketcap)
                            
                            self.stock.stockImage = "https://s3.polygon.io/logos/\(ticker.lowercased())/logo.png"
                            
                            
                            self.stock.stockCEO = decodedData.ceo
                            
                        }
                        
                        
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            task.resume()
        }
        
        if let url = URL(string: stockPriceURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {data, response, error in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                }
                
                if let safePriceData = data {
                    
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(StockPriceData.self, from: safePriceData)
                        DispatchQueue.main.async {
                            self.stock.stockPrice = String(format: "%.2f",decodedData.results[0].c)
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
            }
            
            task.resume()
        }
        
        
        if let url = URL(string: stockNewsURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {data, response, error in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                }
                
                if let safePriceData = data {
                    
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(NewsResult.self, from: safePriceData)
                        
                        DispatchQueue.main.async {
                            self.stock.results = decodedData.results
                        }
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
            }
            
            task.resume()
        }
    }
    
    
    func calculateMarketCap(marketCap: Int) -> String {
        if marketCap > 1000000000000 {
            return "\(marketCap / 1000000000000)T"
        } else if marketCap > 1000000000 {
            return "\(marketCap / 1000000000)B"
        } else if marketCap > 1000000 {
            return "\(marketCap / 1000000)M"
        } else {
            return String(marketCap)
        }
    }
}

