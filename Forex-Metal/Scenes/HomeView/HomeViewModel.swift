//
//  HomeViewModel.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-05-16.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published
    private(set) var rates: ResultState<SpotRateDisplayables, ErrorDisplayable> = .waiting
    
    private var adapter: RateSpotAdapter
    
    private var spotRatesTask: Task<Void, Never>?
    
    init(adapter: RateSpotAdapter) {
        self.adapter = adapter
    }
    
    func fetchRates() {
        spotRatesTask?.cancel()
        spotRatesTask = Task {
            let result = await adapter.getSportsRate()
            DispatchQueue.main.async { self.rates = .fromResult(result: result) }
        }
    }
}
