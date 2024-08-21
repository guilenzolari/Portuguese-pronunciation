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
    @State private var currentState: ViewState = .start
    
    var body: some View {
        VStack {
            SegmentedProgressView(value: 0, maximum: 10)
            
            switch currentState {
            case .start:
                StartAnswerView(audioPlayer: audioPlayer,
                                sentence: sentence,
                                pronunciation: pronunciation,
                                speechRecognizer: speechRecognizer,
                                isRecording: $isRecording)
            case .rightAnswer:
                RightAnswerView(audioPlayer: audioPlayer,
                                sentence: sentence,
                                pronunciation: pronunciation,
                                speechRecognizer: speechRecognizer,
                                isRecording: isRecording)
            case .wrongAnswer:
                WrongAnswerView(audioPlayer: audioPlayer,
                                sentence: sentence,
                                pronunciation: pronunciation,
                                speechRecognizer: speechRecognizer)
            }
        }
        .padding()
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .background(Color(UIColor.systemGroupedBackground))
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
