//
//  Rope.swift
//  LampChallenge
//
//  Created by mohsen mokhtari on 8/11/23.
//

import SwiftUI

struct Rope: Shape {
    
    var lampOffset: CGSize
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: 0))
            path.addLine(to: .init(x: lampOffset.width + rect.midX, y: lampOffset.height))
        }
    }

    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(lampOffset.width, lampOffset.height) }
        set {
            lampOffset.width = newValue.first
            lampOffset.height = newValue.second
        }
    }
}
