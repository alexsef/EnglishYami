//
//  ViewModel.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 01.11.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import SwiftUI

protocol TranslateViewModelProtocol: ObservableObject {
    func fetchTranslate(word: String)
}

class TranslateViewModel: TranslateViewModelProtocol {

    let networkManager = NetworkManager()
    
    @Published var translateText = ""
    
    func fetchTranslate(word: String) {
        networkManager.getTranslatedText(word: word) { [weak self] translatedText in
            self?.translateText = translatedText
        }
    }
}
