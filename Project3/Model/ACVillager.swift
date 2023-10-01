//
//  Villager.swift
//  Project3
//
//  Created by Dave Gumba on 2023-09-30.
//

import Foundation

struct ACVillager: CustomStringConvertible, Identifiable, Codable {

    // MARK: Properties
    var id = UUID()
    
    let name: String
    let url: String
    let titleColor: String
    let textColor: String
    let imageURL: String
    let species: String
    let personality: String
    let gender: String
    let birthdayMonth: String
    let birthdayDay: String
    let sign: String
    let quote: String
    let phrase: String
    let clothing: String
    let islander: Bool
    let debut: String
    let appearances: [String]
    let prevPhrases: [String]
    
    // MARK: Info
    var description: String {
        return "Villager with name \(name). \n Species: \(species)\n Personality: \(personality)"
    }
    
    // MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case id, name, url, species, personality, gender
        case sign, quote, phrase, clothing, islander, debut, appearances
        case titleColor = "title_color"
        case textColor = "text_color"
        case imageURL = "image_url"
        case prevPhrases = "prev_phrases"
        case birthdayMonth = "birthday_month"
        case birthdayDay = "birthday_day"
    }
    
    // MARK: Example data
    
    static func example1() -> ACVillager {
        return ACVillager(name: "Plath", url: "google.com", titleColor: "", textColor: "", imageURL: "", species: "", personality: "", gender: "Male", birthdayMonth: "", birthdayDay: "", sign: "", quote: "", phrase: "", clothing: "", islander: true, debut: "", appearances: [""], prevPhrases: [""])
    }
    
    static func example2() -> ACVillager {
        return ACVillager(name: "Tom", url: "google.com", titleColor: "", textColor: "", imageURL: "", species: "", personality: "", gender: "Female", birthdayMonth: "", birthdayDay: "", sign: "", quote: "", phrase: "", clothing: "", islander: true, debut: "", appearances: [""], prevPhrases: [""])
    }
    
}

enum Gender: Codable {
    case Male
    case Female
    case Other
}
