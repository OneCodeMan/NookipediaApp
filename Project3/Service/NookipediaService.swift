//
//  NookipediaService.swift
//  Project3
//
//  Created by Dave Gumba on 2023-09-30.
//

import Foundation

final class NookipediaService: ObservableObject {
    @Published var NOOKIPEDIA_API_KEY = ""
    
    init() {
        self.NOOKIPEDIA_API_KEY = getAPIKey()
    }
    
    func fetchVillagers() -> [ACVillager] {
        
        return []
    }
    
    func fetchFish() -> [ACFish] {

        return []
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
