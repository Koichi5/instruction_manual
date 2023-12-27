//
//  RobotCleanerMaintenanceRealityArea.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/24.
//

import SwiftUI

struct RobotCleanerMaintenanceArea: View {
    @State private var selectedItem: MaintenanceItem? = MaintenanceItem.term
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
                Text("dust box")
            case .filter:
                Text("filter")
            case nil:
                // TODO: add error view
                Text("error")
            }
        }
    }
}

#Preview {
    RobotCleanerMaintenanceArea()
}
