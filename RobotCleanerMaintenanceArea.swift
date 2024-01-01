//
//  RobotCleanerMaintenanceRealityArea.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/24.
//

import SwiftUI

struct RobotCleanerMaintenanceArea: View {
    @State private var selectedItem: MaintenanceItem? = MaintenanceItem.term
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    @ObservedObject private var model = AreaViewModel()
    var body: some View {
        NavigationSplitView {
            List(MaintenanceItem.allCases, id: \.self, selection: $selectedItem) { mentenanceItem in
                Text(mentenanceItem.rawValue)
                    .tag(mentenanceItem)
            }
            .navigationTitle("Maintenance")
        } detail: {
            switch selectedItem {
            case .term:
                RobotCleanerMaintenanceTermTableArea()
            case .dustBox:
                RobotCleanerMaintenanceDustBoxMovieArea()
            case .filter:
                Text("filter")
            case nil:
                // TODO: add error view
                Text("error")
            }
        }
        .ornament(attachmentAnchor: .scene(_: .bottom)) {
            switch selectedItem {
            case .term:
                Text("")
            case .dustBox:
                Button(action: {
                    openWindow(id: model.robotCleanerMaintenanceDustBoxRealityAreaId)
                    dismissWindow(id: model.robotCleanerMaintenanceId)
                }) {
                    Text("View in RealityView")
                }
                    .glassBackgroundEffect()
            case .filter:
                Text("filter")
            case nil:
                Text("")
            }
        }
    }
}

#Preview {
    RobotCleanerMaintenanceArea()
}
