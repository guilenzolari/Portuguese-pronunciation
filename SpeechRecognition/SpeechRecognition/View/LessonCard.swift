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
    
    init(lessonText: String, description: String) {
        self.lessonText = lessonText
        self.description = description
    }
    
    var body: some View {
        Button(action: {
            print("OI")
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
                            .foregroundStyle(.black)
                    }
                    .padding()
                    .padding(.bottom, 28)
                    Spacer()
                }
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color(.lightGray))
                        .frame(width: 352, height: 100)
                }
                .padding()
            }
        })
    }
}

#Preview {
    LessonCard(lessonText: "Lição 1",
               description: "Expanda seu vocabulário sobre frutas")
}
