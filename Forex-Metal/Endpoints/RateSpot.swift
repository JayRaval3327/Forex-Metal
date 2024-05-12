//
//  RateSpot.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-05-12.
//

import Foundation
import Alamofire

enum RateSpot {
    case getAll
}

extension RateSpot: Requestable {
    var headers: Alamofire.HTTPHeaders? {
        nil
    }
    
    var baseURL: String? {
        return Server.selectedServer.urlString
    }
    
    var path: String {
        return "/Rate_Spot"
    }
    
    var method: Alamofire.HTTPMethod {
        return.post
    }
    
    var parameters: Alamofire.Parameters? {
        return ["TokenId": "V3A0-D7I7-L3A0-L7M7",
                "UserId": 0,
                "PreferenceTypeName": "mobile"]
    }
}
