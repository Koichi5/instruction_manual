//
//  CompletedRealityArea.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/15.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct CompletedRealityArea: View {
    @Environment(\.dismissWindow) private var dismissWindow
    @ObservedObject private var model = AreaViewModel()
    let attachmentID = "attachmentID"
    var body: some View {
        RealityView { content, attachments in
            guard let entity = try? await Entity(named: "CompletedScene", in: realityKitContentBundle)
            else {
                fatalError("Unable to load completed scene model")
            }
            
            guard let env = try? await EnvironmentResource(named: "Directional")
            else { return }
            
            let iblComponent = ImageBasedLightComponent(source: .single(env), intensityExponent: 1.0)

            entity.components[ImageBasedLightComponent.self] = iblComponent
            entity.components.set(ImageBasedLightReceiverComponent(imageBasedLight: entity))
            
            content.add(entity)
            
            if let sceneAttachment = attachments.entity(for: attachmentID) {
                sceneAttachment.position = SIMD3<Float>(0, -0.1, 0.15)
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
                Button(action: {
                    dismissWindow(id: model.completedAreaId)
                }) {
                    Text("Close")
                }
            }
        }
    }
}

#Preview {
    CompletedRealityArea()
}
