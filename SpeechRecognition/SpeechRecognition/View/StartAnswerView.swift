//
//  StartAnswerView.swift
//  SpeechRecognition
//
//  Created by Guilherme Ferreira Lenzolari on 14/08/24.
//

import SwiftUI

struct StartAnswerView: View {
    var audioPlayer: AudioPlayerViewModel
    @EnvironmentObject var router: Router
    var sentence: String
    var pronunciation: String
    var speechRecognizer: SpeechRecognizer
    @Binding var isRecording: Bool
    
    init(audioPlayer: AudioPlayerViewModel, 
         sentence: String,
         pronunciation: String,
         speechRecognizer: SpeechRecognizer,
         isRecording: Binding<Bool>) {
        self.audioPlayer = audioPlayer
        self.sentence = sentence
        self.pronunciation = pronunciation
        self.speechRecognizer = speechRecognizer
        self._isRecording = isRecording
    }
    
    var body: some View {
        VStack {
            HStack {
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
                if !router.navPath.isEmpty {
                       router.navigateBack()
                   } else {
                       print("Navigation path is empty, can't navigate back")
                   }
            } label: {
                Text("I can't talk right now")
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .foregroundStyle(.blue)
                    .bold()
                    .background {
                        RoundedRectangle(cornerRadius: 8.0)
                            .foregroundStyle(.white)
                    }
            }
            
            if !self.isRecording {
                Button {
                    self.speechRecognizer.startSpeechRecording()
                    self.isRecording.toggle()
                } label: {
                    Text("Touch to speak")
                        .buttonStyle(.borderedProminent)
                        .frame(maxWidth: .infinity, maxHeight: 35)
                        .bold()
                }
                .buttonStyle(.borderedProminent)
                .bold()
            } else {
                ButtonWaveView(speechRecognizer: speechRecognizer,
                               isRecording: $isRecording)
            }
        }
    }
}
