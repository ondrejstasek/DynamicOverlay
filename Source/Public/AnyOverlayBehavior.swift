//
//  AnyOverlayBehavior.swift
//  DynamicOverlay
//
//  Created by Ondřej Stašek on 23.11.2021.
//  Copyright © 2021 Fabernovel. All rights reserved.
//

import Foundation

public struct AnyDynamicOverlayBehavior: DynamicOverlayBehavior {

    let behavior: DynamicOverlayBehavior

    init(_ behavior: DynamicOverlayBehavior) {
        self.behavior = behavior
    }

    public func makeModifier() -> AddDynamicOverlayBehaviorModifier {
        behavior.makeModifier()
    }
}
