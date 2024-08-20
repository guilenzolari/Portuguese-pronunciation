//
//  SpeechRecognitionApp.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 07/08/24.
//

import SwiftUI

@main
struct SpeechRecognitionApp: App {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    @ObservedObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                NavigationStack(path: $router.navPath) {
                    SentenceView()
//                    LessonsView(viewModel: LessonsViewModel())
//                        .navigationDestination(for: Router.Destination.self) { destination in
//                            switch destination {
//                            case .colorsLessonsView:
//                                SentenceView()
//                            case .fruitsLessonsView:
//                                FruitsLessonView()
//                            default:
//                                EmptyView()
//                            }
//                        }
                }
                .environmentObject(router)
            } else {
                OnboardingView()
            }
                
        }
    }
}
