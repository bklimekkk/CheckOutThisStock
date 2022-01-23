//
//  StockData.swift
//  StockData
//
//  Created by MAC on 15/11/2021.
//

import Foundation
struct Result: Decodable {
    let stocks: [Stocks]
}
struct Stocks: Identifiable, Decodable, Hashable {
    let id: Int
    let ticker: String
    let company: String
}
