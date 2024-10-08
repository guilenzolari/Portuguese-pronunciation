//
//  startView.swift
//  SpeechRecognition
//
//  Created by Guilherme Ferreira Lenzolari on 14/08/24.
//

import SwiftUI

struct RightAnswerView: View {
    var audioPlayer: AudioPlayerViewModel
    var sentence: String
    var pronunciation: String
    var speechRecognizer: SpeechRecognizer
    var isRecording: Bool
    @Binding var state: ViewState
    @Binding var sentanceCount: Int
    
    init(audioPlayer: AudioPlayerViewModel, sentence: String, pronunciation: String, speechRecognizer: SpeechRecognizer, isRecording: Bool, sentanceCount: Binding<Int>, state: Binding<ViewState>) {
        self.audioPlayer = audioPlayer
        self.sentence = sentence
        self.pronunciation = pronunciation
        self.speechRecognizer = speechRecognizer
        self.isRecording = isRecording
        self._sentanceCount = sentanceCount
        self._state = state
    }
    
    var body: some View {
        HStack{
            Text("Your pronnunciation is spot on")
                .font(.title2)
                .bold()
                .padding()
            Spacer()
        }
        
        HStack {
            Image("birdRightAnswer")
            
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
            Text("Play Record")
                .frame(maxWidth: .infinity, maxHeight: 35)
                .bold()
        }
        .buttonStyle(.borderedProminent)
        
        //cant talk
        Button {
            if sentanceCount < 7 {
                sentanceCount += 1
                state = .start
            } else {
                state = .congrats
                sentanceCount = 0
            }
        } label: {
            Text("Continue")
                .frame(maxWidth: .infinity, maxHeight: 35)
                .bold()
            
        }
        .buttonStyle(.borderedProminent)
        
        
    }
}
