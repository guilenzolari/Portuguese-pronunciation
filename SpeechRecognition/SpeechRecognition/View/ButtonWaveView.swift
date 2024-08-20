//
//  ButtonWaveView.swift
//  SpeechRecognition
//
//  Created by Yasmin Kaline on 19/08/24.
//

import SwiftUI

struct ButtonWaveView: View {
    @State private var isFavorite = false

    var body: some View {
        Button(action: {
            isFavorite.toggle()
        }) {
            HStack(spacing: -0.5) {
                ForEach(0..<6, id: \.self) { _ in
                    Image(systemName: "waveform")
                        .font(.system(size: 28))
                        .symbolEffect(.bounce, options: .speed(0.1).repeat(4), value: isFavorite)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 45)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
    }
}

#Preview {
    ButtonWaveView()
}
