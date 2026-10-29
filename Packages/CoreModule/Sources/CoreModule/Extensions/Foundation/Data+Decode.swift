//
//  Data+Decode.swift
//  CoreModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import Foundation

extension Data {
    public func decode<T: Decodable>(_ type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: self)
    }
}
