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
    
    func fetchResultInModel(word: String, completion: @escaping ([UnpreparedWord]?) -> Void) {
        
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
                    let words = try JSONDecoder().decode([UnpreparedWord].self, from: data)
                    guard words.count > 0 else { return }
                    completion(words)
                } catch let jsonError {
                    print(jsonError.localizedDescription)
                }
            }
        }.resume()
    }
    
    func getImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        let preparedUrlString = prepareURLString(urlString: urlString)
        guard let url = URL(string: preparedUrlString) else { return }
        
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
    
    func prepareURLString(urlString: String) -> String {
        var urlString = urlString
        urlString.removeFirst(min(urlString.count, 2))
        return "https://\(urlString)"
    }
}
