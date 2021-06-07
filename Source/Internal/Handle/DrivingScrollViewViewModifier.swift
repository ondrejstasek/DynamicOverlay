//
//  DrivingScrollViewViewModifier.swift
//  DynamicOverlay
//
//  Created by Gaétan Zanella on 28/12/2020.
//  Copyright © 2020 Fabernovel. All rights reserved.
//

import SwiftUI

struct DrivingScrollViewViewModifier: ViewModifier {

    @State
    private var inspectionView = DrivingScrollViewInspectionView()

    let isActive: Bool

    func body(content: Content) -> some View {
        content
            .preference(
                key: DynamicOverlayScrollPreferenceKey.self,
                value: DynamicOverlayDrivingScrollViewHandle(
                    isActive: isActive,
                    view: inspectionView
                )
            )
            .overlay(
                DrivingScrollViewInspectionViewAdaptator(
                    view: inspectionView
                )
                .frame(width: 0, height: 0)
            )
    }
}

private struct DrivingScrollViewInspectionViewAdaptator: UIViewRepresentable {

    let view: DrivingScrollViewInspectionView

    func makeUIView(context: Context) -> DrivingScrollViewInspectionView {
        view
    }

    func updateUIView(_ uiView: DrivingScrollViewInspectionView, context: Context) {}
}
