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
    @State var isRecording = false
    @StateObject var audioPlayer = AudioPlayerViewModel(audio: "mao", audioFormat: "m4a")
    @State var sentanceCount = 0
    @State private var currentState: ViewState = .wrongAnswer
    
    var body: some View {
        NavigationView {
            VStack {
                
                SegmentedProgressView(value: 0, maximum: 10)
                
                switch currentState {
                case .start:
                    StartAnswerView(audioPlayer: audioPlayer, sentence: sentence, pronunciation: pronunciation, speechRecognizer: speechRecognizer, isRecording: $isRecording)
                case .rightAnswer:
                    RightAnswerView(audioPlayer: audioPlayer, sentence: sentence, pronunciation: pronunciation, speechRecognizer: speechRecognizer, isRecording: isRecording)
                case .wrongAnswer:
                    WrongAnswerView(audioPlayer: audioPlayer, sentence: sentence, pronunciation: pronunciation, speechRecognizer: speechRecognizer)
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

enum ViewState {
    case start
    case rightAnswer
    case wrongAnswer
}
