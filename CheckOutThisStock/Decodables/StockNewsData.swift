//
//  StockNewsData.swift
//  newProject
//
//  Created by MAC on 17/11/2021.
//

import Foundation
struct NewsResult: Decodable {
    let results: [Results]
}
struct Results: Identifiable, Decodable, Hashable {

    let id: String
    let title: String
    let author: String
    let image_url: String
    let article_url: String
    let publisher: Publisher
}

struct Publisher: Decodable, Hashable {
    let name: String
    let logo_url: String
}

