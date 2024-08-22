//
//  ButtonWaveView.swift
//  SpeechRecognition
//
//  Created by Yasmin Kaline on 19/08/24.
//

import SwiftUI

struct ButtonWaveView: View {
    @Binding var isRecording: Bool
    @Binding var state: ViewState
    var speechRecognizer: SpeechRecognizer

    var body: some View {
        Button(action: {
            isRecording = false
            self.speechRecognizer.stopSpeechRecording()
            self.state = speechRecognizer.comparisonResult
        }) {
            HStack(spacing: -0.5) {
                ForEach(0..<6, id: \.self) { _ in
                    Image(systemName: "waveform")
                        .font(.system(size: 28))
                        .symbolEffect(.bounce, options: .speed(0.1).repeat(.max), value: isRecording)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 45)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
    }
}
