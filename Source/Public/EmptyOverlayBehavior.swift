//
//  EmptyOverlayBehavior.swift
//  DynamicOverlay
//
//  Created by Ondřej Stašek on 23.11.2021.
//  Copyright © 2021 Fabernovel. All rights reserved.
//

import Foundation

public struct EmptyOverlayBehavior: DynamicOverlayBehavior {

    public func makeModifier() -> AddDynamicOverlayBehaviorModifier {
        AddDynamicOverlayBehaviorModifier(
            value: DynamicOverlayBehaviorValue()
        )
    }

}
