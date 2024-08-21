//
//  LessonCard.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 09/08/24.
//

import SwiftUI

struct LessonCard: View {
    
    var lessonIcon: String

    var sentences: [Lesson.Sentence]
    var lessonText: LocalizedStringKey
    var description: LocalizedStringKey
    
    @EnvironmentObject var router: Router
    var destination: Router.Destination
    
    init(lessonText: LocalizedStringKey,
         lessonIcon: String,
         destination: Router.Destination,
         sentences: [Lesson.Sentence],
        description: LocalizedStringKey
    ) {
        self.lessonText = lessonText
        self.lessonIcon = lessonIcon
        self.description = description
        self.destination = destination
        self.sentences = sentences
    }
    
    var body: some View {
        NavigationLink {
            SentenceView(sentences: sentences, title: lessonText)
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: lessonIcon)
                            .foregroundStyle(.blue)
                        
                        Text(lessonText)
                            .bold()
                            .font(.system(size: 16))
                            .foregroundStyle(.black)
                    }
                    
                    Text(description)
                        .fontWeight(.regular)
                        .font(.system(size: 17))
                        .lineLimit(2)
                        .foregroundStyle(.black)
                }
                .padding()
                .padding(.bottom, 28)
                Spacer()
            }
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(Color.white)
                    .shadow(radius: 2, x: 0, y: 2)
            }
        }
    }
}
