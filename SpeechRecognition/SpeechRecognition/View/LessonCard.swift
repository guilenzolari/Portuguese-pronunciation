//
//  LessonCard.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 09/08/24.
//

import SwiftUI

struct LessonCard: View {
    
    var lessonText: String
    var description: String
    
    @EnvironmentObject var router: Router
    var destination: Router.Destination
    
    init(lessonText: String,
         description: String,
         destination: Router.Destination) {
        self.lessonText = lessonText
        self.description = description
        self.destination = destination
    }
    
    var body: some View {
        Button(action: {
            router.navigate(to: destination)
        }, label: {
            ZStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(lessonText)
                            .bold()
                            .font(.system(size: 16))
                            .foregroundStyle(.black)
                        
                        Text(description)
                            .fontWeight(.regular)
                            .font(.system(size: 12))
                            .lineLimit(2)
                            .foregroundStyle(.black)
                    }
                    .padding()
                    .padding(.bottom, 28)
                    Spacer()
                }
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color(.lightGray))
                }
                .padding()
            }
        })
        .frame(width: 352, height: 100)
    }
}
