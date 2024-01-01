//
//  RobotCleanerMaintenanceDustBoxMovieArea.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/28.
//

import SwiftUI
import swiftui_loop_videoplayer

struct RobotCleanerMaintenanceDustBoxMovieArea: View {
    var body: some View {
        LoopPlayerView {
            Settings {
                FileName("RobotCleanerDustBox")
                Ext("mp4")
                Gravity(.resizeAspectFill)
                ErrorGroup{
                    EColor(.accentColor)
                    EFontSize(27)
                }
            }
        }
        .aspectRatio(contentMode: .fill)
        .scaledToFill()
    }
}

#Preview {
    RobotCleanerMaintenanceDustBoxMovieArea()
}
