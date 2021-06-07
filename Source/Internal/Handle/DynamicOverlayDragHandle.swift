//
//  DynamicOverlayDragHandle.swift
//  DynamicOverlay
//
//  Created by Gaétan Zanella on 04/12/2020.
//  Copyright © 2020 Fabernovel. All rights reserved.
//

import SwiftUI

struct DynamicOverlayDragHandle: Equatable {

    struct Spot: Equatable {
        let frame: CGRect
        let isActive: Bool
    }

    private(set) var spots: [Spot]

    mutating func merge(_ handle: DynamicOverlayDragHandle) {
        spots += handle.spots
    }

    func contains(_ point: CGPoint) -> Bool {
        spots.contains { $0.frame.contains(point) && $0.isActive }
    }
}

extension DynamicOverlayDragHandle {

    static var `default`: DynamicOverlayDragHandle {
        DynamicOverlayDragHandle(spots: [])
    }
}

struct DynamicOverlayDragHandlePreferenceKey: PreferenceKey {

    typealias Value = DynamicOverlayDragHandle

    static var defaultValue: DynamicOverlayDragHandle = .default

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.merge(nextValue())
    }
}

class DrivingScrollViewInspectionView: UIView {

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    // MARK: - Private

    private func setUp() {
        isUserInteractionEnabled = false
        isHidden = true
    }
}

struct DynamicOverlayDrivingScrollViewHandle: Equatable {

    private(set) var isActive: Bool
    private(set) var view: DrivingScrollViewInspectionView?

    mutating func merge(_ handle: DynamicOverlayDrivingScrollViewHandle) {
        guard handle.isActive else { return }
        self.isActive = true
        self.view = handle.view
    }

    static var `default`: DynamicOverlayDrivingScrollViewHandle {
        .inactive()
    }

    static func inactive() -> DynamicOverlayDrivingScrollViewHandle {
        DynamicOverlayDrivingScrollViewHandle(isActive: false, view: nil)
    }
}

struct DynamicOverlayScrollPreferenceKey: PreferenceKey {

    static var defaultValue: DynamicOverlayDrivingScrollViewHandle = .inactive()

    static func reduce(value: inout DynamicOverlayDrivingScrollViewHandle, nextValue: () -> DynamicOverlayDrivingScrollViewHandle) {
        value.merge(nextValue())
    }
}
