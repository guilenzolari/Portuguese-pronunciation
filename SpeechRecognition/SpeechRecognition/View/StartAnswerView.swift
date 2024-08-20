//
//  StartAnswerView.swift
//  SpeechRecognition
//
//  Created by Guilherme Ferreira Lenzolari on 14/08/24.
//

import SwiftUI

struct StartAnswerView: View {
    var audioPlayer: AudioPlayerViewModel
    var sentence: String
    var pronunciation: String
    var speechRecognizer: SpeechRecognizer
    @Binding var isRecording: Bool
    
    init(audioPlayer: AudioPlayerViewModel, sentence: String, pronunciation: String, speechRecognizer: SpeechRecognizer, isRecording: Binding<Bool>) {
        self.audioPlayer = audioPlayer
        self.sentence = sentence
        self.pronunciation = pronunciation
        self.speechRecognizer = speechRecognizer
        self._isRecording = isRecording
    }
    
    var body: some View {
        HStack{
            Text("Speak this sentence")
                .font(.title2)
                .bold()
                .padding()
            Spacer()
        }
        
        HStack {
            Image("birdStart")
            
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
        
        //cant talk
        Button {
        } label: {
            Text("I can't talk right now")
                .frame(maxWidth: .infinity, maxHeight: 35)
                .bold()
        }
        .buttonStyle(.borderedProminent)
        
        Button {
            if self.isRecording {
                self.speechRecognizer.stopSpeechRecording()
            } else {
                self.speechRecognizer.startSpeechRecording()
            }
            self.isRecording.toggle()
        } label: {
            if isRecording {
                Text("Touch to speak")
                    .buttonStyle(.borderedProminent)
                    .frame(maxWidth: .infinity, maxHeight: 35)
                    .bold()
            } else {
                HStack{
                    Image(systemName: "waveform")
                        .padding(.horizontal, -5)
                    Image(systemName: "waveform")
                        .padding(.horizontal, -5)
                    Image(systemName: "waveform")
                        .padding(.horizontal, -5)
                    Image(systemName: "waveform")
                        .padding(.horizontal, -5)
                    Image(systemName: "waveform")
                        .padding(.horizontal, -5)
                } .frame(maxWidth: .infinity, maxHeight: 35)
            }
        }.buttonStyle(.borderedProminent)
            .bold()

    }
}
