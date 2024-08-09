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
        case words
    }
    
    var id = UUID()
    var title: String
    var description: String
    var words: [Word]
    
    struct Word: Codable {
        var word: String
        var phonetic: String
        var audioFileName: String
        var audioFormat: String
    }
}
