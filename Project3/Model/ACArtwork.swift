//
//  ACArtwork.swift
//  Project3
//
//  Created by Dave Gumba on 2023-09-30.
//

import Foundation

struct ACArtwork: Identifiable, Codable {
    let id = UUID()
    
    let name: String
    let url: String
    let hasFake: Bool
    let artName: String
    let artType: String
    let author: String
    let year: String
    let artStyle: String
    let buy: Int
    let sell: Int
    let availability: String
    let width: Int
    let length: Int
    let realInfo: ACArtInfo
    let fakeInfo: ACArtInfo
    
    enum CodingKeys: String, CodingKey {
        case id, name, url, author, year, buy, sell, availability, width, length
        case hasFake = "has_fake"
        case artName = "art_name"
        case artType = "art_type"
        case artStyle = "art_style"
        case realInfo = "real_info"
        case fakeInfo = "fake_info"
    }
}

struct ACArtInfo: Codable {
    let imageUrl: String
    let textureUrl: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case imageUrl = "image_url"
        case textureUrl = "texture_url"
    }
}
