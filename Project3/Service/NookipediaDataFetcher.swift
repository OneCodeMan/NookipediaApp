//
//  NookipediaDataFetcher.swift
//  Project3
//
//  Created by Dave Gumba on 2023-10-01.
//

/**
 Separate from NookipediaService so we can separate network layer and error handling.
 */

import Foundation
import UIKit

class NookipediaDataFetcher: ObservableObject {
    let BASE_URL = "https://api.nookipedia.com/"
    
    @Published var villagers = [ACVillager]()
    @Published var fish = [ACFish]()
    @Published var furniture = [ACFurniture]()
    @Published var artwork = [ACArtwork]()
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: NookipediaServiceProtocol
    
    init(service: NookipediaServiceProtocol = NookipediaService()) {
        self.service = service
        fetchAllVillagers()
    }
    
    // MARK: API calls
    // TODO: there's a pattern here, fix this.
    func fetchAllVillagers() {
        isLoading = true
        errorMessage = nil
        
        let urlString = "\(BASE_URL)villagers"
        let url = URL(string: urlString)
        service.fetchVillagers(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .success(let villagers):
                    print("Success with villagers: \(villagers.count) of 'em")
                    self.villagers = villagers
                }
            }
            
        }
    }
    
    func fetchAllFurniture() {
        
    }
    
    func fetchAllArtwork() {
        
    }
    
    // MARK: For preview
    
    static func errorStateForPreview() -> NookipediaDataFetcher {
        let fetcher = NookipediaDataFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successStateForPreview() -> NookipediaDataFetcher {
        let fetcher = NookipediaDataFetcher()
        fetcher.villagers = []
        return fetcher
    }
}
