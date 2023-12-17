//
//  ContentView.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/15.
//

import SwiftUI

struct ContentView: View {
    let images = ["ShelfContentArea"]
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    @ObservedObject private var model = AreaViewModel()
    
    var body: some View {
        NavigationSplitView {
            List {
                Text("Item List")
            }
            .navigationTitle("Hello Wolrd !")
        } detail: {
            ScrollView() {
                LazyVGrid(
                    columns: Array(repeating: .init(.flexible()), count: 3),
                    alignment: .center,
                    spacing: 4
                ) {
                    ForEach(images, id: \.self) { imageName in
                        Color.black
                            .aspectRatio(1, contentMode: .fill)
                            .overlay(
                                Image(imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .onTapGesture {
                                        openWindow(id: "\(imageName)Id")
                                    }
                            )
                            .clipped()
                    }
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
