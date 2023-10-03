//
//  Villager.swift
//  Project3
//
//  Created by Dave Gumba on 2023-09-30.
//

import Foundation

struct ACVillager: CustomStringConvertible, Identifiable, Codable {

    // MARK: Properties
    var id: String
    
    let name: String
    let url: String
    let titleColor: String
    let textColor: String
    let imageURL: String
    let species: String
    let personality: String
    let gender: Gender
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
    
    // MARK: Initializer
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(String.self, forKey: .url)
        self.species = try container.decode(String.self, forKey: .species)
        self.personality = try container.decode(String.self, forKey: .personality)
        self.gender = try container.decode(Gender.self, forKey: .gender)
        self.sign = try container.decode(String.self, forKey: .sign)
        self.quote = try container.decode(String.self, forKey: .quote)
        self.phrase = try container.decode(String.self, forKey: .phrase)
        self.clothing = try container.decode(String.self, forKey: .clothing)
        self.islander = try container.decode(Bool.self, forKey: .islander)
        self.debut = try container.decode(String.self, forKey: .debut)
        self.appearances = try container.decode([String].self, forKey: .appearances)
        self.titleColor = try container.decode(String.self, forKey: .titleColor)
        self.textColor = try container.decode(String.self, forKey: .textColor)
        self.imageURL = try container.decode(String.self, forKey: .imageURL)
        self.prevPhrases = try container.decode([String].self, forKey: .prevPhrases)
        self.birthdayMonth = try container.decode(String.self, forKey: .birthdayMonth)
        self.birthdayDay = try container.decode(String.self, forKey: .birthdayDay)
    }
    
    
    
    // MARK: Example data
    
//    static func example1() -> ACVillager {
//        return ACVillager(name: "Plath", url: "google.com", titleColor: "", textColor: "", imageURL: "", species: "", personality: "", gender: "Male", birthdayMonth: "", birthdayDay: "", sign: "", quote: "", phrase: "", clothing: "", islander: true, debut: "", appearances: [""], prevPhrases: [""])
//    }
//    
//    static func example2() -> ACVillager {
//        return ACVillager(name: "Tom", url: "google.com", titleColor: "", textColor: "", imageURL: "", species: "", personality: "", gender: "Female", birthdayMonth: "", birthdayDay: "", sign: "", quote: "", phrase: "", clothing: "", islander: true, debut: "", appearances: [""], prevPhrases: [""])
//    }
    
}

enum Gender: String, Codable {
    case Male = "Male"
    case Female = "Female"
    case Other
}
