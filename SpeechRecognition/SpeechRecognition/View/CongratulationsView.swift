//
//  SwiftUIView.swift
//  SpeechRecognition
//
//  Created by Guilherme Ferreira Lenzolari on 14/08/24.
//

import SwiftUI

struct SwiftUIView: View {
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        
        VStack{
            Spacer()
            
            Image("Medalha")
                .resizable()
                .frame(width: 154, height: 188)
                .padding()
            
            Text("Congratulations, you have completed your task! Keep practicing to improve you pronnunciation.")
                .font(.title3)
                .padding()
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button {
                dismiss()
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
