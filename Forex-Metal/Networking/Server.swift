//
//  Server.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-05-03.
//

import Foundation

struct Server {
    let urlString: String

    init(urlString: String) {
        self.urlString = urlString
    }
}

extension Server {
    static var selected: Server?
}

extension Server {
    static var selectedServer: Server {
        guard let server = Self.selected else {
            fatalError("You must set a selected server via `Server.selected`")
        }
        return server
    }
}

extension Server {
    static let vadilal = Server(urlString: "https://www.vadilalmarkets.com/beta/api/v1/vadilalmarket.asmx")
}
