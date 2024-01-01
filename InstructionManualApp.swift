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
        
        Group {
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
        }
        
        Group {
            WindowGroup(id: model.robotCleanerContentAreaId) {
                RobotCleanerContentView()
            }
            
            WindowGroup(id: model.robotCleanerNumId) {
                RobotCleanerNumRealityArea()
            }
            
            WindowGroup(id: model.robotCleanerMaintenanceId) {
                RobotCleanerMaintenanceArea()
            }
            
            WindowGroup(id: model.robotCleanerMaintenanceTermTableAreaId) {
                RobotCleanerMaintenanceTermTableArea()
            }
            
            WindowGroup(id: model.robotCleanerMaintenanceDustBoxRealityAreaId) {
                RobotCleanerMaintenanceDustBoxRealityArea()
            }
//            .defaultSize(width: 800, height: 900, depth: 1200)
            .windowResizability(.contentSize)
        }
        
        ImmersiveSpace(id: model.immersiveAreaId) {
            ImmersiveView()
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
