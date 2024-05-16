//
//  RateSpotAdapter.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-05-12.
//

import Foundation
import Alamofire

protocol RateSpotAdapter {
    func getSportsRate() async -> Result<SpotRateDisplayables, ErrorDisplayable>
}

extension NetworkAdapter: RateSpotAdapter {
    func getSportsRate() async -> Result<SpotRateDisplayables, ErrorDisplayable> {
        do {
            let rates = try await sendRequest(for: RateSpot.getAll, responseModel: Spots.self)
            return .success(rates.data.map({ .init(rate: $0) }))
        } catch {
            return .failure(ErrorDisplayable(error))
        }
    }
}
