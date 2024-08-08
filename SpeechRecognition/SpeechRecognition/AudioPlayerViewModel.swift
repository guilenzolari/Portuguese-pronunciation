//
//  AudioPlayer.swift
//  SpeechRecognition
//
//  Created by Guilherme Ferreira Lenzolari on 08/08/24.
//

import Foundation
import AVFoundation

class AudioPlayerViewModel: ObservableObject {
    var audioPlayer: AVAudioPlayer?

    @Published var isPlaying = false

    // Função para carregar um arquivo de áudio específico
    func loadAudio(named fileName: String, ofType fileType: String) {
        if let sound = Bundle.main.path(forResource: fileName, ofType: fileType) {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
                self.audioPlayer?.prepareToPlay()
            } catch {
                print("AVAudioPlayer could not be instantiated.")
            }
        } else {
            print("Audio file \(fileName).\(fileType) could not be found.")
        }
    }

    func playOrPause() {
        guard let player = audioPlayer else { return }

        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }
}
