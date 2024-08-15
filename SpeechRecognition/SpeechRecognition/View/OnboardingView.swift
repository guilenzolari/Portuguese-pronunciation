//
//  OnboardingView.swift
//  OnboardingView
//
//  Created by Yasmin Kaline on 14/08/24.
//

import SwiftUI


struct OnboardingView: View {
    @State private var currentIndex = 0
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentIndex) {
                    OnboardingCardView(image: Image("Onboarding_1"), title: "Access different lessons to train your pronunciation.")
                        .tag(0)
                    OnboardingCardView(image: Image("Onboarding_2"), title: "Play the sentence that will be presented and see if you got it right.")
                        .tag(1)
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                
                if currentIndex == 1 {
                    NavigationLink(destination: LessonsView(viewModel: LessonsViewModel())) {
                        Text("Continue")
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 45)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                    .simultaneousGesture(TapGesture().onEnded {
                        hasSeenOnboarding = true
                    })
                } else {
                    Button(action: {}) {
                        Text("Continue")
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 45)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                    .disabled(true)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
