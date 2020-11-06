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
    
    func fetchResultInModel(word: String, completion: @escaping ([UnpreparedWordModel]?, Int) -> Void) {
        
        let page = 1
        let pageSize = 10
        
        let urlString = "https://dictionary.skyeng.ru/api/public/v1/words/search?search=\(word)&page=\(page)&pageSize=\(pageSize)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data,
                      error == nil,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200
                else {
                    return
                }
                
                do {
                    let words = try JSONDecoder().decode([UnpreparedWordModel].self, from: data)
                    guard words.count > 0 else { return }
                    let wordModel = words
                    completion(wordModel, words.count)
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
                guard error == nil,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200,
                      let data = data,
                      let loadedImage = UIImage(data: data)
                else {
                    return
                }
                completion(loadedImage)
            }
        }
        .resume()
    }
}
