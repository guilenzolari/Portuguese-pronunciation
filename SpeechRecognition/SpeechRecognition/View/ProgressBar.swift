//
//  ProgressBar.swift
//  SpeechRecognition
//
//  Created by Guilherme Ferreira Lenzolari on 14/08/24.
//

import Foundation
import SwiftUI

struct SegmentedProgressView: View {
    var value: Int
    var maximum: Int
    var height: CGFloat = 10
    var spacing: CGFloat = 2
    var selectedColor: Color = .accentColor
    var unselectedColor: Color = Color.secondary.opacity(0.3)
    
    init(value: Int, maximum: Int){
        self.value = value
        self.maximum = maximum
    }
    
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<maximum, id: \.self) { index in
                Rectangle()
                    .foregroundColor(index < self.value ? self.selectedColor : self.unselectedColor)
            }
        }
        .frame(maxHeight: height)
        .clipShape(Capsule())
    }
}

#Preview {
    SegmentedProgressView(value: 3, maximum: 10)
}
