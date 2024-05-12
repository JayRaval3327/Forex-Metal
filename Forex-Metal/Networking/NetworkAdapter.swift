//
//  NetworkAdapter.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-04-22.
//

import Foundation
import Combine
import Alamofire

protocol Networkable {
    func sendRequest<T: Decodable>(for requestable: Requestable, responseModel: T.Type) async throws -> T
}

class NetworkAdapter: Networkable {
    func sendRequest<T: Decodable>(for requestable: Requestable, responseModel: T.Type) async throws -> T {
        let request = try requestable.asURLRequest()
        
        do {
            let response = try await AF.request(request)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
//                .response { response in
//                    guard let data = response.data else {
//                        print("Response data is nil.")
//                        return
//                    }
//                    do {
//                        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
//                            print("Failed to parse JSON response.")
//                            return
//                        }
//                        print("Raw response received from server: \(json)")
//                    } catch {
//                        print("Error parsing JSON response: \(error)")
//                    }
//                }
                .serializingDecodable(responseModel.self)
                .value
            
            return response
        } catch {
            print("Request failed: \(error)")
            throw error
        }
    }
}
