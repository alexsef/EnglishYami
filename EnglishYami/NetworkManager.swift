//
//  NetworkManager.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 02.11.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import Foundation
import SwiftUI

class NetworkManager {
    
    func fetchResultInModel(word: String, completion: @escaping (Word?) -> Void) {
        
        let urlString = "https://dictionary.skyeng.ru/api/public/v1/words/search?search=\(word)&page=1&pageSize=1"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                guard error == nil else { return }
                
                do {
                    let words = try JSONDecoder().decode([Word].self, from: data)
                    guard words.count > 0 else { return }
                    let wordModel = words[0]
                    completion(wordModel)
                } catch let jsonError {
                    print(jsonError.localizedDescription)
                }
            }
        }.resume()
    }
    
    func getImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url)  { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else { return }
                guard let data = data else { return }
                guard let loadedImage = UIImage(data: data) else { return }
                completion(loadedImage)
            }
        }
        .resume()
    }
}
