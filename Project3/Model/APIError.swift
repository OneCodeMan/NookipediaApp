//
//  APIError.swift
//  Project3
//
//  Created by Dave Gumba on 2023-10-01.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        // For user feedback
        switch self {
        case .badURL, .parsing, .unknown:
            return "Sorry, something went wrong."
        case .badResponse(_):
            return "Sorry, server connection failed."
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong."
        }
    }
    
    var description: String {
        // For debugging
        switch self {
        case .badURL: return "Bad URL"
        case .badResponse(statusCode: let statusCode):
            return "Bad response, status code: \(statusCode)"
        case .url(let error):
            return error?.localizedDescription ?? "URLSession error"
        case .parsing(let error):
            return "Parsing error: \(error?.localizedDescription ?? "")"
        case .unknown:
            return "Unknown error"
        }
    }
    
    
}
