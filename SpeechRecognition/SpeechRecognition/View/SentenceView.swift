//
//  ContentView.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 07/08/24.
//

import SwiftUI
import Speech

struct SentenceView: View {
    
    var title = "Colors"
    var sentence = "Coração"
    var pronunciation = "Como se pronuncia"
    var speechRecognizer = SpeechRecognizer(targetWord: "Coração")
    
    @State private var isRecording = false
    @State var sentanceCount = 0
    @StateObject var audioPlayer = AudioPlayerViewModel(audio: "mao", audioFormat: "m4a")
    
    var body: some View {
        SegmentedProgressView(value: 0, maximum: 10)
            .padding(.horizontal)
        VStack {
            HStack{
                Text("Speak this sentence")
                    .font(.title2)
                    .bold()
                    .padding()
                
                Spacer()
            }
            
            HStack {
                Image("birdStart")
                    .resizable()
                    .frame(width: 129, height: 130)
                    .font(.title)
                    .padding()
                
                VStack {
                    HStack {
                        Button(action: {
                            audioPlayer.playOrPause()
                        }) {
                            Image(systemName:"speaker.wave.3.fill", variableValue: audioPlayer.waveValue)
                                .font(.title)
                                .foregroundStyle(.blue)
                        }
                        
                        Text("\"\(sentence)\"")
                            .font(.title)
                    }
                    Text("/\(pronunciation)/")
                }
                Spacer()
            }
            
            Spacer()
            
            //                Button(action: {
            //                    self.speechRecognizer.audioRecorder.playRecording()
            //                }) {
            //                    Text("Play Recording")
            //                        .padding()
            //                        .background(Color.blue)
            //                        .foregroundColor(.white)
            //                        .cornerRadius(10)
            //                }
            
            Button(action: {
                if self.isRecording {
                    self.speechRecognizer.stopSpeechRecording()
                } else {
                    self.speechRecognizer.startSpeechRecording()
                }
                self.isRecording.toggle()
            }) {
                Text("Touch to speak")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(title)
            }
        }
        .toolbarBackground(.white, for: .navigationBar)
        .background(Color(UIColor.systemGroupedBackground))
    }
}

#Preview {
    SentenceView()
}
