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
    
    // MARK: State
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    init(nookipediaDataFetcher: NookipediaDataFetcherProtocol) {
        self.nookipediaDataFetcher = nookipediaDataFetcher
        fetchVillagers()
    }
    
    func fetchVillagers() {
        nookipediaDataFetcher.getVillagers()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
                
            }, receiveValue: { [weak self] data in
                self?.villagers = data
            }).store(in: &cancellables)
    }
}
