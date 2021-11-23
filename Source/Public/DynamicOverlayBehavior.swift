//
//  DynamicOverlayBehavior.swift
//  DynamicOverlay
//
//  Created by Gaétan Zanella on 02/12/2020.
//  Copyright © 2020 Fabernovel. All rights reserved.
//

import SwiftUI

/// A protocol that describes the overlay behavior.
public protocol DynamicOverlayBehavior {

    func makeModifier() -> AddDynamicOverlayBehaviorModifier

    func eraseToAnyDynamicOverlayBehavior() -> AnyDynamicOverlayBehavior
}

public extension DynamicOverlayBehavior {

    func eraseToAnyDynamicOverlayBehavior() -> AnyDynamicOverlayBehavior {
        return AnyDynamicOverlayBehavior(self)
    }

}
