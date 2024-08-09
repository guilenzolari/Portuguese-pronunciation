//
//  AudioPlayer.swift
//  SpeechRecognition
//
//  Created by Guilherme Ferreira Lenzolari on 08/08/24.
//

import Foundation
import AVFoundation

class AudioPlayerViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
    var audioPlayer: AVAudioPlayer?
    var audio: String
    var audioFormat: String
    
    @Published var isPlaying = false
    
    init(audio: String, audioFormat: String) {
        self.audio = audio
        self.audioFormat = audioFormat
        super.init()
        if let sound = Bundle.main.path(forResource: audio, ofType: audioFormat) {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
                self.audioPlayer?.delegate = self
            } catch {
                print("AVAudioPlayer could not be instantiated.")
            }
        } else {
            print("Audio file could not be found.")
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
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
        if flag {
            print("Audio finished playing successfully.")
        } else {
            print("Audio playback finished due to an error.")
        }
    }
    
}
