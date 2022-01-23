//
//  Stock.swift
//  newProject
//
//  Created by MAC on 16/11/2021.
//

import Foundation
import UIKit

struct Stock {
    var stockName: String
    var stockPrice: String
    var stockTicker: String
    var stockImage: String
    var stockDescription: String
    var stockMarketCap: String
    var stockCEO: String
    var exchange: String
    var similar: [SimilarStocks]
    var results: [Results]
}
