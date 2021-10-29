//
//  MapApp.swift
//  DynamicOverlay_Example
//
//  Created by Gaétan Zanella on 05/03/2019.
//  Copyright © 2019 Fabernovel. All rights reserved.
//

import UIKit
import SwiftUI
import DynamicOverlay

struct ContentView: View {
    @State var notch: Notch = .min
    @State var showContent2 = false

    enum Notch: CaseIterable, Equatable { case min, middle, max }

    var body: some View {
        Color.white
            .dynamicOverlay(overlayView)
            .dynamicOverlayBehavior(behavior)
    }

    private var behavior: some DynamicOverlayBehavior {
        //MagneticNotchOverlayBehavior<Notch> { _ in .absolute(showContent2 ? 400 : 200) }
        return MagneticNotchOverlayBehavior<Notch> { notch in
            switch notch {
            case .min:
                return .absolute(100)
            case .middle:
                return .fractional(0.5)
            case .max:
                return .fractional(1)
            }
        }
        .notchChange($notch)
    }

    private var overlayView: some View {
        VStack(spacing: 0) {
            Capsule().frame(width: 50, height: 20).draggable()
            List {
                ForEach(1..<50) {
                    Text("Row \($0)")
                }
            }
            .drivingScrollView()
        }
    }
}

struct OverlayContent: View {
    let title: String
    let color: Color
    let action: () -> Void

    var body: some View {
        ZStack(alignment: .top) {
            color
            VStack {
                Text(title).font(.title)
                Button(action: action, label: { Text("Action") }).padding()
            }
        }
    }
}

@main
struct MapApp: App {

    @UIApplicationDelegateAdaptor(UIKitAppDelegate.self)
    private var delegate: UIKitAppDelegate

    @State var open: Bool = false

    var body: some Scene {
        WindowGroup {
            Button("action") {
                open = true
            }
            .sheet(isPresented: $open) {
                ContentView()
            }
        }
    }
}
