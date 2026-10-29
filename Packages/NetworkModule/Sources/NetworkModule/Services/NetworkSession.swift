//
//  NetworkSession.swift
//  NetworkModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import Foundation

public protocol NetworkSession: Sendable {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkSession {}
