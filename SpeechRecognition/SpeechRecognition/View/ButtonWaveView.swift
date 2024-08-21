//
//  ButtonWaveView.swift
//  SpeechRecognition
//
//  Created by Yasmin Kaline on 19/08/24.
//

import SwiftUI

struct ButtonWaveView: View {
    
    var speechRecognizer: SpeechRecognizer
    @State private var isFavorite = false
    @Binding var isRecording: Bool
    
    init(speechRecognizer: SpeechRecognizer, 
         isFavorite: Bool = false,
         isRecording: Binding<Bool>) {
        self.speechRecognizer = speechRecognizer
        self.isFavorite = isFavorite
        self._isRecording = isRecording
    }

    var body: some View {
        Button(action: {
            self.isFavorite.toggle()
            self.speechRecognizer.stopSpeechRecording()
            self.isRecording.toggle()
        }) {
            HStack(spacing: -0.5) {
                ForEach(0..<6, id: \.self) { _ in
                    Image(systemName: "waveform")
                        .font(.system(size: 28))
                        .symbolEffect(.bounce, options: .speed(0.1).repeat(.max), value: isFavorite)
                }
            }
        }
        .onAppear {
            print(isFavorite)
        }
        .frame(maxWidth: .infinity, maxHeight: 45)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
    }
}

