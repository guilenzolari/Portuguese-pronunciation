//
//  ContentView.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 07/08/24.
//

import SwiftUI
import Speech

struct ContentView: View {
    var speechRecognizer = SpeechRecognizer(targetWord: "oi")
    @State private var isRecording = false

    var body: some View {
        VStack {
            Text(speechRecognizer.transcribedText)
                .padding()

            Button(action: {
                if self.isRecording {
                    self.speechRecognizer.stopSpeechRecording()
                } else {
                    self.speechRecognizer.startSpeechRecording()
                }
                self.isRecording.toggle()
            }) {
                Text(isRecording ? "Stop Recording" : "Start Recording")
                    .padding()
                    .background(isRecording ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                self.speechRecognizer.audioRecorder.playRecording()
            }) {
                Text("Play Recording")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text(speechRecognizer.comparisonResult ? "Word Matched!" : "Word Not Matched")
                .padding()
                .foregroundColor(speechRecognizer.comparisonResult ? .green : .red)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
