//
//  Lesson.swift
//  SpeechRecognition
//
//  Created by Guilherme Ferreira Lenzolari on 09/08/24.
//

import Foundation

struct Lesson: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case sentences
        case sfSymbol
    }
    
    var id = UUID()
    var title: String
    var description: String
    var sentences: [Sentence]
    var sfSymbol: String
    
    struct Sentence: Codable {
        var sentence: String
        var phonetic: String
        var audioFileName: String
        var audioFormat: String
    }
}
