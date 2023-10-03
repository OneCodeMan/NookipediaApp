//
//  ContentView.swift
//  Project3
//
//  Created by Dave Gumba on 2023-09-21.
//

import SwiftUI

struct ContentView: View {
    // CONVERT TO COORDINATOR PATTERN
    @StateObject var nookipediaViewModel = NookipediaViewModel(nookipediaDataFetcher: NookipediaDataFetcher())
    
    var body: some View {
        
        if nookipediaViewModel.isLoading {
            ProgressView() // TODO: Make custom
        } else if nookipediaViewModel.errorMessage != nil {
            Text("Error: \(nookipediaViewModel.errorMessage ?? "")") // TODO: Make custom
        } else {
            Text("Success")
        }
    }
}

#Preview {
    ContentView()
}
