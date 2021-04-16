//
//  ViewController.swift
//  DynamicOverlay_Example
//
//  Created by Gaétan Zanella on 05/03/2019.
//  Copyright © 2019 Fabernovel. All rights reserved.
//

import UIKit
import SwiftUI
import DynamicOverlay

class ViewController: UIHostingController<ContentView> {

    // MARK: - Life Cycle

    init() {
        super.init(rootView: ContentView())
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct ContentView: View {

    @State var notch: Notch = .min

    enum Notch: String, CaseIterable, Equatable {
        case min
        case med
        case max
    }

    var body: some View {
        ZStack {
            Color.blue
        }
//        .ignoresSafeArea()
        .dynamicOverlay(
            VStack {
                Text("HELLo")
                List {
                    Text("Hello A")
                    Text("Hello Z")
                }
            }
            .drivingScrollView()
//            .ignoresSafeArea()
        )
//        .ignoresSafeArea()
        .dynamicOverlayBehavior(notchOverlayBehavior)
    }

    private var notchOverlayBehavior: some DynamicOverlayBehavior {
        MagneticNotchOverlayBehavior<Notch> { notch in
            switch notch {
            case .max:
                return .fractional(0.8)
            case .med:
                return .fractional(0.5)
            case .min:
                return .fractional(0.3)
            }
        }
        .notchChange($notch)
    }
}
