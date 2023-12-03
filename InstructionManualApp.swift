//
//  InstructionManualApp.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/02.
//

import SwiftUI

@main
struct InstructionManualApp: App {
//    @State private var model = AreaViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        WindowGroup(id: "ShelfRealityArea") {
            ShelfRealityArea()
        }
        .defaultSize(CGSize(width: 800, height: 1000))
        
        WindowGroup(id: "EquipmentRealityArea") {
            EquipmentRealityArea()
        }
        .defaultSize(CGSize(width: 800, height: 800))
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
