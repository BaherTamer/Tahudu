//
//  Endpoint.swift
//  NetworkModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import Foundation

public protocol Endpoint: Sendable {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryParams: [String: String]? { get }
}

// MARK: - Config Variables
extension Endpoint {
    public var headers: [String: String]? { nil }
    public var queryParams: [String: String]? { nil }
}

// MARK: - Core Functions
extension Endpoint {
    public func buildURLRequest(with baseDomain: String) throws -> URLRequest {
        let requestURL = try createRequestURL(with: baseDomain)
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        try setRequestQueryParams(&request, requestURL: requestURL)
        return request
    }
}

// MARK: - Private Helpers
extension Endpoint {
    private func createRequestURL(with baseDomain: String) throws -> URL {
        let trimmedDomain = baseDomain.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        guard
            !trimmedDomain.isEmpty,
            baseDomain == trimmedDomain,
            let baseURL = URL(string: "https://" + baseDomain)
        else {
            throw NetworkError.invalidURL
        }
        return baseURL.appendingPathComponent(path)
    }

    private func setRequestQueryParams(
        _ request: inout URLRequest,
        requestURL: URL
    ) throws {
        guard let queryParams else { return }
        var components = URLComponents(
            url: requestURL,
            resolvingAgainstBaseURL: false
        )
        components?.queryItems = queryParams.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        guard let urlWithParams = components?.url else {
            throw NetworkError.invalidURL
        }
        request.url = urlWithParams
    }
}
