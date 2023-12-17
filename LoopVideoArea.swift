//
//  LoopVideoArea.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/17.
//

import SwiftUI
import AVKit

struct LoopVideoArea: View {
    let videoSourcePath: String
    private let player: AVPlayer
    
    init(videoSourcePath: String) {
        self.videoSourcePath = videoSourcePath
        if let url = Bundle.main.url(forResource: videoSourcePath, withExtension: "mp4") {
            player = AVPlayer(url: url)
        } else {
            player = AVPlayer(url: URL(fileURLWithPath: ""))
            print("Unable to load video")
        }
    }
    
    var body: some View {
        VideoPlayer(player: player)
            .onDisappear {
                player.pause()
            }
    }
}

//#Preview {
//    LoopVideoArea()
//}
