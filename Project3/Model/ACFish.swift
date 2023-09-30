//
//  ACFish.swift
//  Project3
//
//  Created by Dave Gumba on 2023-09-30.
//

import Foundation

struct ACFish: Identifiable, Codable {
    
    let id = UUID()
    
    let name: String
    let url: String
    let number: Int
    let imageUrl: String
    let renderUrl: String
    let location: String
    let shadowSize: String
    let rarity: String
    let totalCatch: Int
    let sellNook: Int
    let sellCJ: Int
    let tankWidth: Double
    let tankLength: Double
    let catchPhrases: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, name, url, number, location, rarity, catchPhrases
        case imageUrl = "image_url"
        case renderUrl = "render_url"
        case shadowSize = "shadow_size"
        case totalCatch = "total_catch"
        case sellNook = "sell_nook"
        case sellCJ = "sell_cj"
        case tankWidth = "tank_width"
        case tankLength = "tank_length"
    }
}
