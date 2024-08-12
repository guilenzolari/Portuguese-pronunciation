//
//  LessonsView.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 09/08/24.
//

import SwiftUI

struct LessonsView: View {
    
    @ObservedObject var datas = ReadData()
    
    var body: some View {
        ForEach(datas.lessons, id: \.self) { lessons in
            LessonCard(lessonText: lessons.title,
                       description: lessons.description)
        }
    }
}

#Preview {
    LessonsView()
}
