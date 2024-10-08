//
//  WrongAnswerView.swift
//  SpeechRecognition
//
//  Created by Guilherme Ferreira Lenzolari on 14/08/24.
//

import SwiftUI

struct WrongAnswerView: View {
    var audioPlayer: AudioPlayerViewModel
    var sentence: String
    var pronunciation: String
    var speechRecognizer: SpeechRecognizer
    @Binding var state: ViewState

    init(audioPlayer: AudioPlayerViewModel, sentence: String, pronunciation: String, speechRecognizer: SpeechRecognizer, state: Binding<ViewState>) {
        self.audioPlayer = audioPlayer
        self.sentence = sentence
        self.pronunciation = pronunciation
        self.speechRecognizer = speechRecognizer
        self._state = state
    }
    
    var body: some View {
        HStack{
            Text("Almost there! Keep practicing.")
                .font(.title2)
                .bold()
                .padding()
            Spacer()
        }
        
        HStack {
            Image("birdWrongAnswer")
            
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
        
        //play record
        Button(action: {
            self.speechRecognizer.audioRecorder.playRecording()
        }) {
            Text("Play Recording")
                .frame(maxWidth: .infinity, maxHeight: 35)
                .bold()
        }
        .buttonStyle(.borderedProminent)
        
        //cant talk
        Button {
            state = .start
            speechRecognizer.comparisonResult = .start
        } label: {
            Text("Try Again")
                .frame(maxWidth: .infinity, maxHeight: 35)
                .bold()
            
        }
        .buttonStyle(.borderedProminent)
    }
}
