//
//  ACFurniture.swift
//  Project3
//
//  Created by Dave Gumba on 2023-09-30.
//

import Foundation

struct ACFurniture: Identifiable, Codable {
    let id = UUID()
    
    let name: String
    let url: String
    let category: String
    let itemSeries: String
    let itemSet: String
    let themes: [String]
    let hhaCategory: String
    let hhaBase: Int
    let tag: String
    let isLucky: Bool
    let luckySeason: String
    let buy: String
}
