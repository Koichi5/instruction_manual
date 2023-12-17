//
//  ContentView.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/02.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ShelfContentView: View {
    @ObservedObject private var model = AreaViewModel()
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 25) {
                Button(action: {
                    openWindow(id: model.shelfRealityAreaId)
                }) {
                    VStack {
                        Text("Shelf")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding()
                        Text("See how the shelves are assembled")
                            .monospaced()
                            .font(.system(size: 25, weight: .bold))
                    }
                    .padding()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Button(action: {
                    openWindow(id: model.equipmentRealityAreaId)
                    dismissWindow(id: model.shelfContentAreaId)
                }) {
                    VStack {
                        Text("Equipments")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding()
                        Text("See what tools to use")
                            .monospaced()
                            .font(.system(size: 25, weight: .bold))
                    }
                    .padding()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Button(action: {
                    openWindow(id: model.contentAreaId)
                    dismissWindow(id: model.shelfContentAreaId)
                }) {
                    VStack {
                        Text("Close")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding()
                        Text("See other products")
                            .monospaced()
                            .font(.system(size: 25, weight: .bold))
                    }
                    .padding()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius:  10))
                }
            }
            .padding()
        }
        .background() {
            Image("ShelfContentArea")
        }
    }
}

//struct ShelfContentView: View {
//
//    @State private var showImmersiveSpace = false
//    @State private var immersiveSpaceIsShown = false
//
//    @Environment(\.openImmersiveSpace) var openImmersiveSpace
//    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
//
//    var body: some View {
//        VStack {
//            Model3D(named: "Scene", bundle: realityKitContentBundle)
//                .padding(.bottom, 50)
//
//            Text("Hello, world!")
//
//            Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
//                .toggleStyle(.button)
//                .padding(.top, 50)
//        }
//        .padding()
//        .onChange(of: showImmersiveSpace) { _, newValue in
//            Task {
//                if newValue {
//                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
//                    case .opened:
//                        immersiveSpaceIsShown = true
//                    case .error, .userCancelled:
//                        fallthrough
//                    @unknown default:
//                        immersiveSpaceIsShown = false
//                        showImmersiveSpace = false
//                    }
//                } else if immersiveSpaceIsShown {
//                    await dismissImmersiveSpace()
//                    immersiveSpaceIsShown = false
//                }
//            }
//        }
//    }
//}
//
//#Preview(windowStyle: .automatic) {
//    ContentView()
//}
