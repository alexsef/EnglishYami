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
        networkManager.fetchResultInModel(word: word) { [weak self] unpreparedWordModel, countWords in
            guard let unpreparedWordModel = unpreparedWordModel,
                  let self = self
            else {
                return
            }
            
            for word in unpreparedWordModel {
                let id = word.id
                let text = word.text
                let translatedText = word.meanings[0].translation.text
                let imageURL = word.meanings[0].imageUrl
                
                let word = Word(id: id,
                                text: text,
                                translatedText: translatedText,
                                imageUrl: imageURL)

                self.words.append(word)
            }
        }
    }
}
