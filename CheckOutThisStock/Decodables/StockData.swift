//
//  StockData.swift
//  newProject
//
//  Created by MAC on 16/11/2021.
//

import Foundation
struct StockData: Decodable {
    var url: String
    var name: String
    var symbol: String
    var description: String
    var marketcap: Int
    var ceo: String
    var exchange: String
    var similar: [String]
}
