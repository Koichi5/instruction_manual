//
//  RobotCleanerNumRealityArea.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/17.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct RobotCleanerNumRealityArea: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    @ObservedObject private var model = AreaViewModel()
    @State var isBehind: Bool = false
    let attachmentID = "attachmentID"
    
    var body: some View {
        RealityView { content, attachments in
            guard let entity = try? await Entity(named: "RobotCleanerNumScene", in: realityKitContentBundle) else {
                fatalError("Unalbe to load scene model")
            }
            guard let env = try? await EnvironmentResource(named: "Directional") else { return }
            let iblComponent = ImageBasedLightComponent(source: .single(env), intensityExponent: 10.0)
            
            entity.components[ImageBasedLightComponent.self] = iblComponent
            entity.components.set(ImageBasedLightReceiverComponent(imageBasedLight: entity))
            
            content.add(entity)
            
            if let sceneAttachment = attachments.entity(for: attachmentID) {
//                sceneAttachment.position = isBehind ? SIMD3<Float>(0.1, 0, 0) : SIMD3<Float>(-0.1, 0, 0)
//                sceneAttachment.transform.rotation = simd_quatf(angle: -0.5, axis: SIMD3<Float>(1,0,0))
                content.add(sceneAttachment)
            }
        } update: { content, attachments in
            if let entity = content.entities.first {
//                let ix: Float = 0.0
//                let iy: Float = isBehind ? 0.707107 : 0.0
//                let iz: Float = 0.0
//                let r: Float = isBehind ? 0.707107 : 0.0
                let uniformPosition = isBehind ? SIMD3<Float>(-0.17, 0, 0) : SIMD3<Float>(0.17, 0, 0)
                let uniformRotate = isBehind ? simd_quatf(angle: .pi, axis: SIMD3<Float>(0, 1, 0)) : simd_quatf(angle: 0, axis: SIMD3<Float>(0, 1, 0))
                
                entity.transform.rotation = uniformRotate
                entity.position = uniformPosition
            }
            
            if let attachment = attachments.entity(for: attachmentID) {
                let uniformPosition = isBehind ? SIMD3<Float>(0.17, 0, 0) : SIMD3<Float>(-0.17, 0, 0)
                attachment.position = uniformPosition
            }
        } placeholder: {
            ProgressView()
                .progressViewStyle(.circular)
                .controlSize(.large)
        } attachments: {
            Attachment(id: attachmentID) {
                VStack {
                    Text("名称一覧")
                        .font(.title)
                    if isBehind {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("① クリーナーブラシ")
                                .font(.headline)
                            Text("② 段差センサー")
                                .font(.headline)
                            Text("③ 後輪部分")
                                .font(.headline)
                            Text("④ 吸い込み部分")
                                .font(.headline)
                            Text("⑤ 前輪部分")
                                .font(.headline)
                        }
                        .frame(height: 300)
                    } else {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("① 電源ボタン")
                                .font(.headline)
                            Text("② ホームボタン")
                                .font(.headline)
                            Text("③ バンパー")
                                .font(.headline)
                        }
                        .frame(height: 300)
                    }
                    Button(action: {
                        isBehind.toggle()
                    }) {
                        isBehind ? Text("表面を見る") : Text("裏面を見る")
                    }
                    Button(action: {
                        openWindow(id: model.robotCleanerContentAreaId)
                        dismissWindow(id: model.robotCleanerNumId)
                    }) {
                        Text("Close")
                    }
                }
            }
        }
    }
}

#Preview {
    RobotCleanerNumRealityArea()
}
