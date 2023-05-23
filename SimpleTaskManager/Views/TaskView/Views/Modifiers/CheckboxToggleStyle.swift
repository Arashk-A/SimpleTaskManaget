//
//  CheckboxToggleStyle.swift
//  CodeSample
//
//  Created by zero on 5/23/23.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    Image(systemName: configuration.isOn ? "checkmark.circle" : "circle")
      .resizable()
      .frame(width: 20, height: 20)
      .foregroundColor(configuration.isOn ? .green : .black)
      .onTapGesture { configuration.isOn.toggle() }
  }
}
