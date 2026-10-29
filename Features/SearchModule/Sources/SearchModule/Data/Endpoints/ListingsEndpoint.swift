//
//  ListingsEndpoint.swift
//  Tahudu
//
//  Created by Baher Tamer on 29/10/2026.
//

import NetworkModule

struct ListingsEndpoint: Endpoint {
    // MARK: - Base
    var method: HTTPMethod {
        .get
    }

    var path: String {
        "api/m6nfoc4jlw"
    }

    var headers: [String: String]? {
        ["Accept": "application/json"]
    }
}
