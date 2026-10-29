//
//  NetworkFactory.swift
//  NetworkModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import Foundation

public enum NetworkFactory {
    public static let networkService: NetworkService = RESTNetworkService(
        baseDomain: baseDomain,
        session: URLSession.shared
    )
}

// MARK: - Config Variables
extension NetworkFactory {
    private static let baseDomain: String = {
        guard
            let url = Bundle.main.object(forInfoDictionaryKey: "BASE_DOMAIN") as? String,
            !url.isEmpty
        else {
            fatalError("Missing or invalid BASE_DOMAIN in Info.plist. Please set a non-empty string for the BASE_DOMAIN key in your target's Info.plist (per configuration).")
        }
        return url
    }()
}
