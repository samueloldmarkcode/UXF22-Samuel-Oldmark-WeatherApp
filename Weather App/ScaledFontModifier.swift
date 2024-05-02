//
//  ScaledFontModifier.swift
//  Weather App
//
//  Created by Samuel Oldmark on 2024-05-24.
//

import SwiftUI

struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat
    var weight: Font.Weight = .regular

    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize).weight(weight))
    }
}

extension View {
    func scaledFont(name: String, size: CGFloat, weight: Font.Weight = .regular) -> some View {
        self.modifier(ScaledFont(name: name, size: size, weight: weight))
    }
}

