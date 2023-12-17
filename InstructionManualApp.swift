//
//  InstructionManualApp.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/02.
//

import SwiftUI

@main
struct InstructionManualApp: App {
    @ObservedObject private var model = AreaViewModel()
    var body: some Scene {
        WindowGroup(id: model.contentAreaId) {
            ContentView()
        }
        
        WindowGroup(id: model.shelfContentAreaId) {
            ShelfContentView()
        }
        
        WindowGroup(id: model.shelfRealityAreaId) {
            ShelfRealityArea()
        }
        .defaultSize(CGSize(width: 800, height: 1000))
        
        WindowGroup(id: model.equipmentRealityAreaId) {
            EquipmentRealityArea()
        }
        .defaultSize(CGSize(width: 700, height: 700))
        
        WindowGroup(id: model.videoAreaId) {
            VideoArea(videoSourcePath: "ScrewDetail")
        }
        .defaultSize(CGSize(width: 700, height: 700))
        
        WindowGroup(id: model.completedAreaId) {
            CompletedRealityArea()
        }
        .defaultSize(CGSize(width: 800, height: 900))
        
        ImmersiveSpace(id: model.immersiveAreaId) {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
