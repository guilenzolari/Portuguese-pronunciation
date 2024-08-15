//
//  Router.swift
//  SpeechRecognition
//
//  Created by Raphael Shimamoto on 12/08/24.
//

import Foundation
import SwiftUI
import Observation

final class Router: ObservableObject {
    public enum Destination: Codable, Hashable {
        case colorsLessonsView
        case fruitsLessonsView
        case emptyView
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
