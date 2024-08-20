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
    @Published var waveValue: Double = 1.0
    
    private var timer: Timer?
    
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
            stopUpdatingWaveValue()
        } else {
            player.play()
            isPlaying = true
            startUpdatingWaveValue()
        }
    }
    
    private func startUpdatingWaveValue() {
        stopUpdatingWaveValue()
        timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: true) { [weak self] _ in
            guard let self = self, let player = self.audioPlayer else { return }
            self.waveValue = player.currentTime / player.duration
        }
    }
    
    private func stopUpdatingWaveValue() {
        timer?.invalidate()
        timer = nil
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
        stopUpdatingWaveValue()
        if flag {
            print("Audio finished playing successfully.")
        } else {
            print("Audio playback finished due to an error.")
        }
    }
}
