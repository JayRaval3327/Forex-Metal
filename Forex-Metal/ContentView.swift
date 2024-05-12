//
//  ContentView.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-04-22.
//

import SwiftUI

struct ContentView: View {
    
    private var adapter: RateSpotAdapter
    
    init() {
        self.adapter = NetworkAdapter()
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
//        .task {
//            await adapter.getSportsRate()
//        }
        .padding()
    }
}

#Preview {
    ContentView()
}
