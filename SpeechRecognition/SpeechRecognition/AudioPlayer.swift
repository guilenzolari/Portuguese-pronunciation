//
//  AudioPlayer.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 08/08/24.
//

import Foundation
import AVFoundation

@Observable
final class AudioPlayer: ObservableObject {
  var audioPlayer: AVAudioPlayer?

var isPlaying = false

  init() {
    if let sound = Bundle.main.path(forResource: "PocketCyclopsLvl1", ofType: "mp3") {
      do {
        self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
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
}
