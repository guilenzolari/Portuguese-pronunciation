//
//  ContentView.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 07/08/24.
//

import SwiftUI
import Speech

struct SentenceView: View {
    
    var sentences: [Lesson.Sentence]
    var title: LocalizedStringKey
    @State var speechRecognizer = SpeechRecognizer(targetWord: "")
    @State var isRecording = false
    @State var audioPlayer = AudioPlayerViewModel(audio: "mao", audioFormat: "m4a")
    @State var sentanceCount = 0
    @State var currentState: ViewState = .start
    
    var body: some View {
        NavigationView {
            VStack {
                SegmentedProgressView(value: sentanceCount+1, maximum: sentences.count)

                switch currentState {
                case .start:
                    StartAnswerView(audioPlayer: audioPlayer,
                                    sentence: sentences[sentanceCount].sentence,
                                    pronunciation: sentences[sentanceCount].phonetic,
                                    speechRecognizer: speechRecognizer,
                                    isRecording: $isRecording,
                                    state: $currentState)
                case .rightAnswer:
                    RightAnswerView(audioPlayer: audioPlayer, 
                                    sentence: sentences[sentanceCount].sentence,
                                    pronunciation: sentences[sentanceCount].phonetic,
                                    speechRecognizer: speechRecognizer,
                                    isRecording: isRecording, 
                                    sentanceCount: $sentanceCount, 
                                    state: $currentState)
                case .wrongAnswer:
                    WrongAnswerView(audioPlayer: audioPlayer, 
                                    sentence: sentences[sentanceCount].sentence,
                                    pronunciation: sentences[sentanceCount].phonetic,
                                    speechRecognizer: speechRecognizer,
                                    state: $currentState)
                case .congrats:
                    SwiftUIView()
                }
            }
            .padding()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .background(Color(UIColor.systemGroupedBackground))
        .onAppear {
            self.audioPlayer = AudioPlayerViewModel(audio: sentences[sentanceCount].audioFileName, audioFormat: "m4a")
            speechRecognizer = SpeechRecognizer(targetWord: sentences[sentanceCount].sentence)
        }
        .onChange(of: sentanceCount) { oldValue, newValue in
            self.audioPlayer = AudioPlayerViewModel(audio: sentences[sentanceCount].audioFileName, audioFormat: "m4a")
            speechRecognizer = SpeechRecognizer(targetWord: sentences[sentanceCount].sentence)
            print(sentences[sentanceCount].sentence)
        }
    }
}

enum ViewState {
    case start
    case rightAnswer
    case wrongAnswer
    case congrats
}
