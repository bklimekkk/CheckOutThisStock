//
//  ReadLater.swift
//  newProject
//
//  Created by MAC on 21/11/2021.
//

import Foundation

struct ReadLater: Identifiable, Comparable, Hashable {
    static func < (lhs: ReadLater, rhs: ReadLater) -> Bool {
        return lhs.date > rhs.date
    }
    
    let id: String
    let date: Int
    let title: String
    let author: String
    let image_url: String
    let article_url: String
    let name: String
    let logo_url: String
}
