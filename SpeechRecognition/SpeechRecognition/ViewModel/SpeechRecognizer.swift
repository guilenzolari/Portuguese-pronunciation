//
//  SpeechRecognizer.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 07/08/24.
//

import SwiftUI
import Speech
import AVFoundation
import Observation

@Observable
final class SpeechRecognizer {
    private var speechRecognizer: SFSpeechRecognizer?
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    @MainActor var transcribedText = ""
    var comparisonResult = false
    var comparisionWord: String
    
    let audioRecorder: AudioRecorder

    init(targetWord: String) {
        self.speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "pt-BR"))
        self.comparisionWord = targetWord
        self.audioRecorder = AudioRecorder()
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

    func startSpeechRecording() {
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
                    self.compareSpeechTranscription(with: self.comparisionWord)
                }
            }

            if let error = error {
                print("Recognition error: \(error.localizedDescription)")
                self.stopSpeechRecording()
            }
        }

        let recordingFormat = inputNode.outputFormat(forBus: 0)
        
        do {
            try audioRecorder.startRecording(with: recordingFormat)
        } catch {
            print("Failed to create AVAudioFile: \(error.localizedDescription)")
        }

        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, when in
            self.recognitionRequest?.append(buffer)
            do {
                try self.audioRecorder.recordingWriteBuffer(buffer: buffer)
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

    func stopSpeechRecording() {
        audioEngine.stop()
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()

        let inputNode = audioEngine.inputNode
        inputNode.removeTap(onBus: 0)
    }
    
    @MainActor func compareSpeechTranscription(with word: String) {
        self.comparisonResult = transcribedText.lowercased().contains(word.lowercased())
        print("Comparison Result: \(self.comparisonResult)")
    }
}
