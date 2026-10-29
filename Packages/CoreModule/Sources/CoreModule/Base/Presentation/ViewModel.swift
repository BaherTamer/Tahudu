//
//  ViewModel.swift
//  CoreModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import Foundation
import SwiftUI

@MainActor
public protocol ViewModel: ObservableObject {
    var state: ViewState { get set }

    func onInit()
    func onRefresh() async
    func onRetry()
}

extension ViewModel {
    public func onRefresh() async {}
    public func onRetry() {}
}

public extension ViewModel {
    func updateState(_ state: ViewState) {
        withAnimation {
            self.state = state
        }
    }
    
    func updateWithAnimation<Result>(_ body: () throws -> Result) rethrows -> Result {
        try withAnimation(.default, body)
    }
}
