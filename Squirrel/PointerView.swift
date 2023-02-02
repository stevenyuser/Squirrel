//
//  PointerView.swift
//  Squirrel
//
//  Created by A. Zheng (github.com/aheze) on 1/31/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import SwiftUI

struct PointerView: View {
    @ObservedObject var viewModel: ViewModel
    @State var visible = false

    var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    colors: [
                        NSColor(hex: viewModel.color).color,
                        NSColor(hex: viewModel.color).offset(by: 0.1).color
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: viewModel.pointerLength, height: viewModel.pointerLength)
            .opacity((viewModel.scrollInteraction != nil) ? 1 : 0)
            .frame(width: viewModel.pointerWindowLength, height: viewModel.pointerWindowLength)
            .scaleEffect((viewModel.scrollInteraction != nil) ? 1 : 1.4)
            .animation(.spring(response: 0.2, dampingFraction: 1, blendDuration: 1), value: viewModel.scrollInteraction != nil)
    }
}
