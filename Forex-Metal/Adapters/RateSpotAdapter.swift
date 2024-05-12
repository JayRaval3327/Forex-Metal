//
//  RateSpotAdapter.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-05-12.
//

import Foundation
import Alamofire

protocol RateSpotAdapter {
    func getSportsRate() async -> Result<SpotRates, ErrorDisplayable>
}

extension NetworkAdapter: RateSpotAdapter {
    func getSportsRate() async -> Result<SpotRates, ErrorDisplayable> {
        do {
            let rates = try await sendRequest(for: RateSpot.getAll, responseModel: Spots.self)
            print(rates.data)
            return .success(rates.data)
        } catch {
            return .failure(ErrorDisplayable(error))
        }
    }
}
