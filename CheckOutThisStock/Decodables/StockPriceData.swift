//
//  StockPriceData.swift
//  newProject
//
//  Created by MAC on 16/11/2021.
//

import Foundation

struct StockPriceData: Decodable {
    let results: [PriceResults]
}

struct PriceResults: Decodable {
    let c: Double
}

