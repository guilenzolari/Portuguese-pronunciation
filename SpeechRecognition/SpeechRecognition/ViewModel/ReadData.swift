//
//  ReadData.swift
//  SpeechRecognition
//
//  Created by Guilherme Ferreira Lenzolari on 09/08/24.
//

import Foundation

class ReadData: ObservableObject  {
    @Published var lessons = [Lesson]()
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "lessons", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let lessons = try? JSONDecoder().decode([Lesson].self, from: data!)
        self.lessons = lessons!
        
    }
     
}
