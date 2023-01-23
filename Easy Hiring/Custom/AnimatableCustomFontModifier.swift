//
//  AnimatableCustomFontModifier.swift
//  Easy Hiring
//
//  Created by Ahmet Bilal KOLSARICI on 1.11.2022.
//

import SwiftUI

struct AnimatableCustomFontModifier: AnimatableModifier {
  var animatableData: CGFloat {
    get { size }
    set { size = newValue }
  }
  var size: CGFloat

  func body(content: Content) -> some View {
    content
      .font(.system(size: size))
  }
}

extension View {
  func animatableFont(size: CGFloat) -> some View {
    modifier(AnimatableCustomFontModifier(size: size))
  }
}
