//
//  NookipediaViewModel.swift
//  Project3
//
//  Created by Dave Gumba on 2023-10-03.
//

import Foundation
import Combine

class NookipediaViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    let nookipediaDataFetcher: NookipediaDataFetcherProtocol
    
    // MARK: Data
    @Published var villagers: [ACVillager] = []
    @Published var fish: [ACFish] = []
    @Published var furniture: [ACFurniture] = []
    @Published var artwork: [ACArtwork] = []
    
    // MARK: State
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    init(nookipediaDataFetcher: NookipediaDataFetcherProtocol) {
        self.nookipediaDataFetcher = nookipediaDataFetcher
        fetchVillagers()
    }
    
    // FIXME: DRY
    func fetchVillagers() {
        nookipediaDataFetcher.getVillagers()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
                
            }, receiveValue: { [weak self] data in
                self?.villagers = data
                print("Got villagers, \(self?.villagers.count) of 'em")
            }).store(in: &cancellables)
    }
    
    func fetchFish() {
        nookipediaDataFetcher.getFish()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
    
            }, receiveValue: { [weak self] data in
                self?.fish = data
                print("Got fish, \(self?.fish.count) of 'em")
            }).store(in: &cancellables)
    }
    
    func fetchFurniture() {
        nookipediaDataFetcher.getFurniture()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
    
            }, receiveValue: { [weak self] data in
                self?.furniture = data
                print("Got furniture, \(self?.furniture.count) of 'em")
            }).store(in: &cancellables)
    }
    
    func fetchArtwork() {
        nookipediaDataFetcher.getArtwork()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
    
            }, receiveValue: { [weak self] data in
                self?.artwork = data
                print("Got artwork, \(self?.artwork.count) of 'em")
            }).store(in: &cancellables)
    }
}
