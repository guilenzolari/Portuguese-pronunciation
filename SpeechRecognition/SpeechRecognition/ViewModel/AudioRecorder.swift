//
//  AudioRecorder.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 09/08/24.
//

import Foundation
import AVFoundation

class AudioRecorder {
    
    private var audioFile: AVAudioFile?
    private var audioPlayer: AVAudioPlayer?
    private var audioFilename = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("audio.caf")
    
    init() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playAndRecord, mode: .spokenAudio, options: .defaultToSpeaker)
            try audioSession.setActive(true)
        } catch {
            print("Failed to set audio session mode and category: \(error.localizedDescription)")
        }
        
        audioFilename = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("audio.caf")
    }
    
    func startRecording(with recordingFormat: AVAudioFormat) throws {
        audioFile = try AVAudioFile(forWriting: audioFilename, settings: recordingFormat.settings)
    }
    
    func recordingWriteBuffer(buffer: AVAudioPCMBuffer) throws {
        try self.audioFile?.write(from: buffer)
    }
    
    func playRecording() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFilename)
            audioPlayer?.play()
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
        }
    }
}
