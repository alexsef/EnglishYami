//
//  NetworkManager.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 02.11.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import Foundation

class NetworkManager {
    func getTranslatedText(word: String, completion: @escaping (String) -> Void) {
        
        let urlString = "https://dictionary.skyeng.ru/api/public/v1/words/search?search=\(word)&page=1&pageSize=1"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    completion("")
                    return
                }
                guard error == nil else {
                    completion("")
                    return
                }
                
                do {
                    let words = try JSONDecoder().decode([Word].self, from: data)
                    let translatedWord = words[0].meanings[0].translation.text
                    completion(translatedWord)
                } catch let jsonError {
                    completion("")
                    print(jsonError.localizedDescription)
                }
            }
        }.resume()
    }
}
