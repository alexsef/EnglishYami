//
//  ContentView.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 30.10.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import SwiftUI

struct Word: Decodable {
    let text: String
    let meanings: [Meaning]
}

struct Meaning: Decodable {
    let translation: Translation
}

struct Translation: Decodable {
    let text: String
}

struct ContentView: View {
    
    @State var searchFieldText = ""
    @State var translateLabel = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Bla-bla").bold()
            TextField("Введите слово", text: $searchFieldText, onCommit: {
        
                self.fetch(word: self.searchFieldText)
                
                }).textFieldStyle(RoundedBorderTextFieldStyle())
            Text(translateLabel)
            Spacer()
        }.padding()
    }
    
    func fetch(word: String) {
        
        let urlString = "https://dictionary.skyeng.ru/api/public/v1/words/search?search=" + word + "&page=1&pageSize=1"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            guard error == nil else { return }
            
            do {
                let words = try JSONDecoder().decode([Word].self, from: data)
                let translationText = words[0].meanings[0].translation.text
                self.translateLabel = translationText
            } catch let jsonError {
                print(jsonError.localizedDescription)
            }
        }.resume()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
