//
//  Watchlist.swift
//  newProject
//
//  Created by MAC on 19/11/2021.
//

import Foundation

struct Watchlist: Identifiable, Comparable {
    static func < (lhs: Watchlist, rhs: Watchlist) -> Bool {
        lhs.company.lowercased() < rhs.company.lowercased()
    }
    
    var id: String
    var ticker: String
    var company: String
    var image: String
}
