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
        
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                LessonsView()
            } else {
                OnboardingView()
            }
        }
    }
}
