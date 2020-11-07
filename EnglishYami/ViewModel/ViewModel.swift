//
//  ViewModel.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 01.11.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import SwiftUI

protocol ResponseViewModelProtocol: ObservableObject {
    func getResponseFromNetwork(word: String)
}

class ResponseViewModel: ResponseViewModelProtocol {

    let networkManager = NetworkManager()
    @Published var words = [Word]()
    
    func getResponseFromNetwork(word: String) {
        networkManager.fetchResultInModel(word: word) { [weak self] unpreparedWords in
            guard let unpreparedWords = unpreparedWords,
                  let self = self
            else {
                return
            }
            
            for word in unpreparedWords {
                let id = word.id
                let text = word.text
                let translatedText = word.meanings[0].translation.text
                let imageURL = word.meanings[0].imageUrl
                let previewUrl = word.meanings[0].previewUrl
                
                var word = Word(id: id,
                                text: text,
                                translatedText: translatedText,
                                imageUrl: imageURL,
                                previewUrl: previewUrl)
                
                self.getImagePreviewFromNetwork(imagePreviewURL: previewUrl) { [weak self] imagePreview in
                    word.previewImage = imagePreview
                    self?.words.append(word)
                }
            }
        }
    }
    
    func getImagePreviewFromNetwork(imagePreviewURL: String, completion: @escaping (UIImage?) -> Void) {
        networkManager.getImage(urlString: imagePreviewURL) { loadedPreviewImage in
            completion(loadedPreviewImage)
        }
    }
}
