//
//  LessonsView.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 09/08/24.
//

import SwiftUI

struct LessonsView: View {
    
    var viewModel: LessonsViewModel
    let languages: [String] = ["English", "Portguese", "Spanish"]
    @State private var selectedLanguage: String = "English"
    
    var body: some View {
        List {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("8")
                            .font(.system(size: 54))
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                        
                        VStack(alignment: .leading) {
                            Text("Achievements")
                                .font(.system(size: 16))
                                .foregroundColor(.blue)
                                .fontWeight(.bold)
                        }
                        Spacer()
                    }
                    Text("You trained 8 days in a row! Keep practicing.")
                        .font(.system(size: 14))
                        .foregroundColor(.primary)
                }
                Spacer()
                Image("Medalha")
                    .resizable()
                    .frame(width: 72, height: 86)
            }
            .padding(.vertical, 16)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
            )
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            
            ForEach(viewModel.datas.lessons, id: \.self) { lesson in
                LessonCard(lessonText: .init(lesson.title),
                           lessonIcon: lesson.sfSymbol,
                           destination: viewModel.changeScreen(for: lesson.category), 
                           sentences: lesson.sentences,
                           description: .init(lesson.description)
                )
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .navigationTitle("Lessons")
        .toolbar {
            ToolbarItem {
//                Menu {
//                    ForEach(languages, id: \.self) { language in
//                        Button(action: {
//                            selectedLanguage = language
//                        }) {
//                            HStack {
//                                Text(language)
//                                Spacer()
//                                if selectedLanguage == language {
//                                    Image(systemName: "checkmark")
//                                        .foregroundColor(.blue)
//                                }
//                            }
//                        }
//                    }
//                } label: {
//                    Image("translate")
//                        .font(.system(size: 14.0, weight: .medium))
//                }
//                .padding()
            }
        }
        .toolbarBackground(.white, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .listStyle(.plain)
        .scrollDisabled(true)
        .background(Color(UIColor.systemGroupedBackground))
    }
}

#Preview {
    LessonsView(viewModel: LessonsViewModel())
}
