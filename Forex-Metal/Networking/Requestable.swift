//
//  Requestable.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-05-03.
//

import Foundation
import Alamofire

protocol Requestable {
    var baseURL: String? { get }
    var path: String { get }
    var method: HTTPMethod { get } // Alamofire.HTTPMethod
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get } // Alamofire.HTTPHeaders
}

extension Requestable {
    func asURLRequest() throws -> URLRequest {
        let stringUrl = baseURL?.appending(path)
        let url = URL(string: stringUrl!)
        var request = URLRequest(url: url!)
        request.method = method
        request.headers = headers ?? HTTPHeaders()
        if let parameters = parameters {
            request = try URLEncoding.default.encode(request, with: parameters)
        }
        return request
    }
}
