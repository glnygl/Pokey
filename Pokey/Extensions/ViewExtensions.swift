//
//  ViewExtensions.swift
//  Pokey
//
//  Created by Glny Gl on 25/07/2024.
//

import SwiftUI

extension View {
    func onViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
    
    func giveShadow(color: Color, radius: CGFloat, x: Double, y: Double) -> some View {
        self.shadow(color: color, radius: radius, x: x, y: y)
    }
    
    func giveRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
