//
//  OnboardingView.swift
//  SpeechRecognition
//
//  Created by Yasmin Kaline on 14/08/24.
//

import SwiftUI

struct OnboardingCardView: View {
    var image: Image
    var title: String
    
    var body: some View {
        VStack {
            Spacer()
            image
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .padding()
            Text(title)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .bold()
                .padding(.horizontal)
            Spacer()
        }
    }
}
