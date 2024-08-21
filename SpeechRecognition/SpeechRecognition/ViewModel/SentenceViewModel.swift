//
//  SentenceViewModel.swift
//  SpeechRecognition
//
//  Created by Guilherme Ferreira Lenzolari on 20/08/24.
//

import Foundation

@Observable
final class SentenceViewModel {
    
    func nextSentence(sentenceCount: inout Int) {
        sentenceCount += 1
    }
}
