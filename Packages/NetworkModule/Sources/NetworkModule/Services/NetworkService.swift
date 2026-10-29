//
//  NetworkService.swift
//  NetworkModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import Foundation

public protocol NetworkService: Sendable {
    func request(with endpoint: Endpoint) async throws -> Data
}
