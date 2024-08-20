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
               lhs.sentences == rhs.sentences &&
               lhs.sfSymbol == rhs.sfSymbol &&
               lhs.category == rhs.category
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(description)
        hasher.combine(sentences)
        hasher.combine(sfSymbol)
        hasher.combine(category)
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case sentences
        case sfSymbol
        case category
    }
    
    var id = UUID()
    var title: String
    var description: String
    var sentences: [Sentence]
    var sfSymbol: String
    var category: String
    
    struct Sentence: Codable, Hashable {
        var sentence: String
        var phonetic: String
        var audioFileName: String
        var audioFormat: String
    }
}
