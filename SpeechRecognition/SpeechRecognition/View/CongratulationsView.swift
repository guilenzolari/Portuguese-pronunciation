//
//  SwiftUIView.swift
//  SpeechRecognition
//
//  Created by Guilherme Ferreira Lenzolari on 14/08/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        
        VStack{
            Spacer()
            
            Image("Medal")
                .padding()
            
            Text("Congratulations, you have completed your task! Keep practicing to improve you pronnunciation.")
                .font(.title3)
                .padding()
                .multilineTextAlignment(.center)
                .bold()
            
            Spacer()
            
            Button {
            } label: {
                Text("Continue")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
        }
    }
}

#Preview {
    SwiftUIView()
}
