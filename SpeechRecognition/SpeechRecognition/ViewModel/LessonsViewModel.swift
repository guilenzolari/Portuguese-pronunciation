//
//  LessonsViewModel.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 14/08/24.
//

import Foundation
import Observation
import SwiftUI

@Observable
final class LessonsViewModel {
    
    var datas = ReadData()
    var router = Router()
    
    func changeScreen(for category: String) -> Router.Destination {
        switch category {
        case "Fruits":
            return .fruitsLessonsView
        case "Colors":
            return .colorsLessonsView
        default:
            return .emptyView
        }
    }
}
