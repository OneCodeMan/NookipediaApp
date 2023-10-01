//
//  ContentView.swift
//  Project3
//
//  Created by Dave Gumba on 2023-09-21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var nookipediaDataFetcher = NookipediaDataFetcher()
    
    var body: some View {
        
        if nookipediaDataFetcher.isLoading {
            ProgressView() // TODO: Make custom
        } else if nookipediaDataFetcher.errorMessage != nil {
            Text("Error: \(nookipediaDataFetcher.errorMessage ?? "")") // TODO: Make custom
        } else {
            Text("Success")
        }
    }
}

#Preview {
    ContentView()
}
