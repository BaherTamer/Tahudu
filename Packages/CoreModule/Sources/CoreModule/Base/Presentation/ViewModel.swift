//
//  ViewModel.swift
//  CoreModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import Foundation

@MainActor
public protocol ViewModel: ObservableObject {
    var state: ViewState { get }

    func onInit() async
    func onRefresh() async
    func onRetry() async
}

extension ViewModel {
    public func onRefresh() async {}
    public func onRetry() async {}
}
