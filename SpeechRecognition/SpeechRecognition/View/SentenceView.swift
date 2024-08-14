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
    var speechRecognizer = SpeechRecognizer(targetWord: "oi")
    @State private var isRecording = false
    @StateObject var audioPlayer = AudioPlayerViewModel(audio: "mao", audioFormat: "m4a")
    @State var sentanceCount = 0
    
    var body: some View {
        NavigationView {
            VStack {
                
                SegmentedProgressView(value: 0, maximum: 10)
                
                HStack{
                    Text("Speak this sentence")
                        .font(.title2)
                        .bold()
                        .padding()
                    Spacer()
                }
                
                HStack {
                    Image(systemName: "tree.fill")
                        .font(.title)
                    
                    VStack {
                        HStack {
                            Button(action: {
                                audioPlayer.playOrPause()
                            }) {
                                Image(systemName:"speaker.wave.3.fill")
                                    .font(.title)
                                    .foregroundStyle(.black)
                            }
                            
                            Text("\"\(sentence)\"")
                                .font(.title)
                        }
                        Text("/\(pronunciation)/")
                    }
                    Spacer()
                }
                
                Spacer()
                
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
                
            }.navigationTitle(title)
                .toolbarTitleDisplayMode(.inline)
                .padding()
        }
        
    }
}

#Preview {
    SentenceView()
}
