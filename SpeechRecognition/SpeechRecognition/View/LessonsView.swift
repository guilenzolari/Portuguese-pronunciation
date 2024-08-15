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
        VStack(alignment: .leading) {
            HStack {
                Text("Lessons")
                    .font(.system(size: 34, weight: .bold))
                    .padding(.top, 16)
                    .padding(.leading, 16)
                    .padding(.bottom, 8)
                
                Spacer()
                
                Menu {
                    ForEach(languages, id: \.self) { language in
                        Button(action: {
                            selectedLanguage = language
                        }) {
                            HStack {
                                Text(language)
                                Spacer()
                                if selectedLanguage == language {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                } label: {
                    Image("translate")
                        .font(.system(size: 14.0, weight: .medium))
                }
                .padding()

            }
            
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
                        Text("You trained 8 days in a row! Keep practising.")
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
                    LessonCard(lessonText: lesson.title,
                               lessonIcon: lesson.sfSymbol,
                               description: lesson.description,
                               destination: viewModel.changeScreen(for: lesson.category))
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .background(Color(UIColor.systemGroupedBackground))
    }
}

#Preview {
    LessonsView(viewModel: LessonsViewModel())
}
