//
//  BlurEffect.swift
//  Music App Streaming
//
//  Created by Omar Leal on 11/1/22.
//

import Foundation
import SwiftUI


struct BlurEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
