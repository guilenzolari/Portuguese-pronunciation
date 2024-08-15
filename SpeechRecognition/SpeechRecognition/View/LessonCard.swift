//
//  LessonCard.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 09/08/24.
//

import SwiftUI

struct LessonCard: View {
    
    var lessonIcon: String
    var lessonText: String
    var description: String
    
    @EnvironmentObject var router: Router
    var destination: Router.Destination
    
    init(lessonText: String,
         lessonIcon: String,
         description: String,
         destination: Router.Destination) {
        self.lessonText = lessonText
        self.lessonIcon = lessonIcon
        self.description = description
        self.destination = destination
    }
    
    var body: some View {
        Button(action: {
            router.navigate(to: destination)
        }, label: {
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
        })
    }
}
