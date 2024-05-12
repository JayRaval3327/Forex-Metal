//
//  NetworkError.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-05-03.
//

import Foundation

enum NetworkError: Error {
    /// `URLConvertible` failed to create a valid `URL`
    case invalidURL(url: URL?)
    case customError(description: String)
    case authorizationFailed
    case responseUnsuccessful(codeError: Int)
    case noDataReceived
    case responseNotDecoded
}


extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .invalidURL(url):
            return "URL is not valid: \(String(describing: url))"
        case let .customError(description):
            return description
        case .authorizationFailed:
            return "Session expired or invalid"
        case let .responseUnsuccessful(codeError):
            return "Response failed \(codeError)"
        case .noDataReceived:
            return "No Data Received"
        case .responseNotDecoded:
            return "Data cannot be decoded"
        }
    }
}
