//
//  Lesson.swift
//  SpeechRecognition
//
//  Created by Guilherme Ferreira Lenzolari on 09/08/24.
//

import Foundation

struct Lesson: Codable, Identifiable, Hashable {
    static func == (lhs: Lesson, rhs: Lesson) -> Bool {
        return lhs.id == rhs.id &&
               lhs.title == rhs.title &&
               lhs.description == rhs.description &&
               lhs.words == rhs.words
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(description)
        hasher.combine(words)
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case words
    }
    
    var id = UUID()
    var title: String
    var description: String
    var words: [Word]
    
    struct Word: Codable, Hashable {
        var word: String
        var phonetic: String
        var audioFileName: String
        var audioFormat: String
    }
}
