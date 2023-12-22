//
//  RobotCleanerContentView.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/17.
//

import SwiftUI
import swiftui_loop_videoplayer

struct RobotCleanerContentView: View {
    @ObservedObject private var model = AreaViewModel()
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 25) {
                Button(action: {
                    openWindow(id: model.robotCleanerNumId)
                    dismissWindow(id: model.robotCleanerContentAreaId)
                }) {
                    VStack {
                        Text("Robot Cleaner Name List")
                            .monospaced()
                            .font(.system(size: 30, weight: .bold))
                            .padding()
                        Text("See robot cleaner name list")
                            .monospaced()
                            .font(.system(size: 22, weight: .bold))
                    }
                    .padding()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Button(action: {
                    openWindow(id: model.robotCleanerNumId)
                    dismissWindow(id: model.robotCleanerContentAreaId)
                }) {
                    VStack {
                        Text("Robot Cleaner Name List")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding()
                        Text("See robot cleaner name list")
                            .monospaced()
                            .font(.system(size: 25, weight: .bold))
                    }
                    .padding()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Button(action: {
                    openWindow(id: model.robotCleanerNumId)
                    dismissWindow(id: model.robotCleanerContentAreaId)
                }) {
                    VStack {
                        Text("Robot Cleaner Name List")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding()
                        Text("See robot cleaner name list")
                            .monospaced()
                            .font(.system(size: 25, weight: .bold))
                    }
                    .padding()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .background() {
//            LoopPlayerView(fileName: "RobotCleaner")
            LoopPlayerView {
                Settings{
                    FileName("RobotCleanerHome")
                    Ext("mp4")
                    Gravity(.resizeAspectFill)
                    ErrorGroup{
                        EColor(.accentColor)
                        EFontSize(27)
                    }
                }
            }
        }
    }
}

#Preview {
    RobotCleanerContentView()
}
