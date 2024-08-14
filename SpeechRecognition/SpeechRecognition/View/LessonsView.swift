//
//  LessonsView.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 09/08/24.
//

import SwiftUI

struct LessonsView: View {
    
    var viewModel: LessonsViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.datas.lessons, id: \.self) { lesson in
                LessonCard(lessonText: lesson.title,
                           description: lesson.description,
                           destination: viewModel.changeScreen(for: lesson.category))
            }
        }
    }

}

#Preview {
    LessonsView(viewModel: LessonsViewModel())
}
