//
//  Domainable.swift
//  CoreModule
//
//  Created by Baher Tamer on 29/10/2026.
//

public protocol Domainable: Decodable {
    associatedtype Domain
    func toDomain() -> Domain
}
