//
//  PronunciationPopupView.swift
//  SpeechRecognition
//
//  Created by Yasmin Kaline on 19/08/24.
//

import SwiftUI

struct PronunciationPopupView: View {
    @Binding var showPopup: Bool
    
    var body: some View {
        VStack(spacing: 50) {
            Image(systemName: "mic.fill")
                .foregroundStyle(.black)
                .font(.system(size: 50))
            
            Text("Pronunciation Skill")
                .font(.headline)
                .bold()
                .font(.system(size: 24))
            
            Text("Listen and repeat what Maya said. You will speak 10 times in this section.")
                .multilineTextAlignment(.center)
            
            Button(action: {
                withAnimation {
                    showPopup = false
                }
            }) {
                Text("Start")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 35)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(4)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
        .frame(maxWidth: 300, maxHeight: 400)
    }
}
