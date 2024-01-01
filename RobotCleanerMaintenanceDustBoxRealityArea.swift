//
//  RobotCleanerMaintenanceDustBoxRealityArea.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/28.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct RobotCleanerMaintenanceDustBoxRealityArea: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    @ObservedObject private var model = AreaViewModel()
    @State private var animationPlayer: AnimationPlaybackController?
    @State private var currentAnimationTime: TimeInterval = 0.0
    @State private var currentStepIndex = 0
    let attachmentID = "attachmentID"
    let stepDurations: [TimeInterval] = [3.3, 3.1, 4.3, 3.6]
    let stepDescriptions = [
        "Step 1: First part of the instruction.",
        "Step 2: Second part of the instruction.",
        "Step 3: Third part of the instruction.",
        "Step 4: Fourth part of the instruction."
    ]
    var body: some View {
        RealityView { content, attachments in
            guard let entity = try? await Entity(named: "RobotCleanerDustBoxScene", in: realityKitContentBundle) else {
                fatalError("Unable to load robot cleaner dust box scene")
            }
            guard let env = try? await EnvironmentResource(named: "Directional") else { return }
            
            let iblComponent = ImageBasedLightComponent(source: .single(env), intensityExponent: 10.0)
            
            entity.components[ImageBasedLightComponent.self] = iblComponent
            entity.components.set(ImageBasedLightReceiverComponent(imageBasedLight: entity))
            
            entity.position = SIMD3<Float>(0, 0, 0.05)
            
            let animation = entity.availableAnimations[0]
            let player = entity.playAnimation(animation.repeat(duration: .infinity), transitionDuration: 0.25, startsPaused: true)
            self.animationPlayer = player
            player.resume()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + stepDurations[currentStepIndex]) {
                self.animationPlayer?.pause() // 指定した時間後にアニメーションを一時停止
            }
            content.add(entity)

            if let sceneAttachment = attachments.entity(for: attachmentID) {
                sceneAttachment.position = SIMD3<Float>(0, -0.2, 0.15)
                sceneAttachment.transform.rotation = simd_quatf(angle: -0.5, axis: SIMD3<Float>(1,0,0))
                content.add(sceneAttachment)
            }
        } update: { content, attachments in
            print("RealityView changes detected ...")
        } placeholder: {
            ProgressView()
                .progressViewStyle(.circular)
                .controlSize(.large)
        } attachments: {
            Attachment(id: attachmentID) {
                VStack {
                    Text(stepDescriptions[currentStepIndex])
                    Button(action: {
                        if currentStepIndex < stepDurations.count - 1 {
                            currentStepIndex += 1
                        }
                        playAnimation(for: stepDurations[currentStepIndex])
                    }) {
                        Text("Next Step")
                    }
                }
            }
        }
    }
    private func playAnimation(for duration: TimeInterval) {
        animationPlayer?.resume()
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.animationPlayer?.pause()
            self.currentAnimationTime += duration // 次のステップの開始時間を更新
        }
    }
}

#Preview {
    RobotCleanerMaintenanceDustBoxRealityArea()
}
