//
//  RESTNetworkService.swift
//  NetworkModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import Foundation

public struct RESTNetworkService: NetworkService {
    // MARK: - Dependencies
    private let baseDomain: String
    private let session: NetworkSession

    // MARK: - Life Cycle
    public init(
        baseDomain: String,
        session: NetworkSession
    ) {
        self.baseDomain = baseDomain
        self.session = session
    }
}

// MARK: - Core Functions
extension RESTNetworkService {
    public func request(with endpoint: Endpoint) async throws -> Data {
        let request = try endpoint.buildURLRequest(with: baseDomain)
        let (data, response) = try await fetchData(with: request)
        try validateResponse(response)
        return data
    }
}

// MARK: - Private Helpers
extension RESTNetworkService {
    private func fetchData(with request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await session.data(for: request)
        } catch let error as URLError {
            throw mapURLError(error)
        } catch {
            throw NetworkError.transportFailure
        }
    }

    private func mapURLError(_ error: URLError) -> NetworkError {
        switch error.code {
        case .notConnectedToInternet,
             .networkConnectionLost,
             .dataNotAllowed,
             .cannotFindHost,
             .cannotConnectToHost,
             .timedOut,
             .internationalRoamingOff:
            .noConnection
        default:
            .transportFailure
        }
    }

    private func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.transportFailure
        }
        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.unacceptableStatus(code: httpResponse.statusCode)
        }
    }
}
