//
//  RobotCleanerMaintenanceRealityArea.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/24.
//

import SwiftUI

struct RobotCleanerMaintenanceArea: View {
    @State private var selectedItem: MaintenanceItem?
    var body: some View {
        NavigationSplitView {
            List(MaintenanceItem.allCases, id: \.self) { mentenanceItem in
                Text(mentenanceItem.rawValue)
                    .tag(mentenanceItem)
            }
            .navigationTitle("Hello World !")
        } detail: {
            if let selectedItem {
                VStack {
                    Text(selectedItem.rawValue)
                }
            }
        }
    }
}

#Preview {
    RobotCleanerMaintenanceArea()
}
