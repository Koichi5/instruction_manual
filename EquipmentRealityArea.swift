//
//  EquipmentRealityAre.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/03.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct EquipmentRealityArea: View {
    let attachmentID = "attachmentID"
    var body: some View {
        RealityView { content, attachments in
            guard let entity = try? await Entity(named: "EquipmentScene", in: realityKitContentBundle) else {
                fatalError("Unable to load equipment scene model")
            }
            content.add(entity)
            
            if let sceneAttachment = attachments.entity(for: attachmentID) {
                sceneAttachment.position = SIMD3<Float>(0, -0.2, 0.9)
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
                Button(action: {}) {
                    Text("Attachment")
                }
            }
        }
    }
}

#Preview {
    EquipmentRealityArea()
}
