//
//  NookipediaService.swift
//  Project3
//
//  Created by Dave Gumba on 2023-09-30.
//

import Foundation
import SwiftUI

struct NookipediaService: NookipediaServiceProtocol {
    var NOOKIPEDIA_API_KEY = ""
    
    init() {
        self.NOOKIPEDIA_API_KEY = "?api_key=\(getAPIKey())"
    }
    
    // MARK: Fetching data
    
    func fetchVillagers(url: URL?, completion: @escaping (Result<[ACVillager], APIError>) -> Void) {
        fetch([ACVillager].self, url: url, completion: completion)
    }
    
    func fetchFurniture(url: URL?, completion: @escaping (Result<[ACFurniture], APIError>) -> Void) {
        fetch([ACFurniture].self, url: url, completion: completion)
    }
    
    // MARK: Generic fetch function

    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) {
        guard let url = url,
            let urlWithAPIKey = URL(string: url.absoluteString + self.NOOKIPEDIA_API_KEY) else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlWithAPIKey) { (data, response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        
        task.resume()
    }
    
    // MARK: Internal functions
    private func getAPIKey() -> String {
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
