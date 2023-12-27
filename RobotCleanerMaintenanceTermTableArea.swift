//
//  RobotCleanerMaintenanceTermTableArea.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/25.
//

import SwiftUI

struct RobotCleanerMaintenanceTermTableArea: View {
    var body: some View {
        Table(robotCleanerMaintenanceTerms) {
            TableColumn("parts") { maintenanceItem in
                Text(maintenanceItem.parts)
            }
            TableColumn("frequency") { maintenanceItem in
                Text(maintenanceItem.frequency)
            }
            TableColumn("exchangeTerm") { maintenanceItem in
                Text(maintenanceItem.exchangeTerm)
            }
        }
    }
}

#Preview {
    RobotCleanerMaintenanceTermTableArea()
}
