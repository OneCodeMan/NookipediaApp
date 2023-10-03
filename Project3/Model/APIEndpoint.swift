//
//  APIEndpoint.swift
//  Project3
//
//  Created by Dave Gumba on 2023-10-03.
//

import Foundation

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var key: String { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum ItemEndpoint: APIEndpoint {
    case getVillagers
    case getFish
    case getFurniture
    case getArtwork
    
    var baseURL: URL {
        return URL(string: APIConstants.BASE_URL)!
    }
    
    var path: String {
        switch self {
        case .getVillagers:
            return APIConstants.VILLAGERS_ENDPOINT
        case .getFish:
            return APIConstants.FISH_ENDPOINT
        case .getFurniture:
            return APIConstants.FURNITURE_ENDPOINT
        case .getArtwork:
            return APIConstants.ARTWORK_ENDPOINT
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getVillagers, .getFish, .getFurniture, .getArtwork:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getVillagers, .getFish, .getFurniture, .getArtwork:
            return [:]
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getVillagers, .getFish, .getFurniture, .getArtwork:
            return [:]
        }
    }
    
    var key: String {
        return APIConstants.getAPIKey()
    }
}

struct APIConstants {
    
    static let BASE_URL = "https://api.nookipedia.com/"
    static let VILLAGERS_ENDPOINT = "villagers"
    static let FISH_ENDPOINT = "nh/fish"
    static let FURNITURE_ENDPOINT = "nh/furniture"
    static let ARTWORK_ENDPOINT = "nh/art"

    static func getAPIKey() -> String {
        var keys: NSDictionary?
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
            if let keysSafe = keys {
                return keysSafe["NOOKIPEDIA_KEY"] as! String
            }
        }
        return ""
    }
}
