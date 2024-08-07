//
//  SpeechRecognizer.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 07/08/24.
//

import SwiftUI
import Speech
import AVFoundation

class SpeechRecognizer: ObservableObject {
    private var speechRecognizer: SFSpeechRecognizer?
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    @Published var transcribedText = ""
    @Published var comparisonResult = false
    
    private var targetWord: String
    private var audioFile: AVAudioFile?
    private var audioPlayer: AVAudioPlayer?
    private let audioFilename = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("recording.mp3")
    
    init(targetWord: String) {
        self.speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "pt-BR"))
        self.targetWord = targetWord
        requestAuthorization()
    }

    func requestAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            DispatchQueue.main.async {
                switch authStatus {
                case .authorized:
                    print("User authorized the use of speech recognition")
                case .denied:
                    print("User denied the use of speech recognition")
                case .restricted:
                    print("Speech recognition is restricted on this device")
                case .notDetermined:
                    print("Speech recognition authorization not determined")
                @unknown default:
                    fatalError()
                }
            }
        }
    }

    func startRecording() {
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()

        let inputNode = audioEngine.inputNode
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        }

        recognitionRequest.shouldReportPartialResults = true

        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
            if let result = result {
                DispatchQueue.main.async {
                    self.transcribedText = result.bestTranscription.formattedString
                    self.compareTranscription(with: self.targetWord)
                }
            }

            if let error = error {
                print("Recognition error: \(error.localizedDescription)")
                self.stopRecording()
            }
        }

        let recordingFormat = inputNode.outputFormat(forBus: 0)
        
        do {
            audioFile = try AVAudioFile(forWriting: audioFilename, settings: recordingFormat.settings)
        } catch {
            print("Failed to create AVAudioFile: \(error.localizedDescription)")
        }

        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, when in
            self.recognitionRequest?.append(buffer)
            do {
                try self.audioFile?.write(from: buffer)
            } catch {
                print("Failed to write audio buffer: \(error.localizedDescription)")
            }
        }

        audioEngine.prepare()

        do {
            try audioEngine.start()
        } catch {
            print("audioEngine couldn't start because of an error: \(error.localizedDescription)")
        }
    }

    func stopRecording() {
        audioEngine.stop()
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()

        let inputNode = audioEngine.inputNode
        inputNode.removeTap(onBus: 0)
    }
    
    private func compareTranscription(with word: String) {
        self.comparisonResult = transcribedText.lowercased().contains(word.lowercased())
        print("Comparison Result: \(self.comparisonResult)")
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
