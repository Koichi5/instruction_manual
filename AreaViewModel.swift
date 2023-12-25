//
//  AreaViewModel.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/02.
//
//
import Foundation

class AreaViewModel: ObservableObject {
    @Published var contentAreaId: String = "ContentArea"
    @Published var shelfContentAreaId: String = "ShelfContentArea"
    @Published var shelfRealityAreaId: String = "ShelfRealityArea"
    @Published var equipmentRealityAreaId: String = "EquipmentRealityArea"
    @Published var videoAreaId: String = "VideoArea"
    @Published var immersiveAreaId: String = "ImmersiveSpace"
    @Published var completedAreaId: String = "CompletedArea"
    @Published var robotCleanerContentAreaId: String = "RobotCleanerContentArea"
    @Published var robotCleanerNumId: String = "RobotCleanerNumAreaId"
    @Published var robotCleanerMaintenanceId: String = "RobotCleanerMaintenanceArea"
}
