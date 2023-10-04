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
import Combine

protocol NookipediaDataFetcherProtocol {
    func getVillagers() -> AnyPublisher<[ACVillager], Error>
    func getFish() -> AnyPublisher<[ACFish], Error>
    func getFurniture() -> AnyPublisher<[ACFurniture], Error>
    func getArtwork() -> AnyPublisher<[ACArtwork], Error>
}

class NookipediaDataFetcher: NookipediaDataFetcherProtocol {
    let apiClient = NookipediaService<ItemEndpoint>()
    
    func getVillagers() -> AnyPublisher<[ACVillager], Error> {
        return apiClient.request(.getVillagers)
    }
    
    func getFish() -> AnyPublisher<[ACFish], Error> {
        return apiClient.request(.getFish)
    }
    
    func getFurniture() -> AnyPublisher<[ACFurniture], Error> {
        return apiClient.request(.getFurniture)
    }
    
    func getArtwork() -> AnyPublisher<[ACArtwork], Error> {
        return apiClient.request(.getArtwork)
    }
}
