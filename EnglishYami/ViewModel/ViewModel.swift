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
    
    @Published var wordModel: Word?
    
    func getResponseFromNetwork(word: String) {
        networkManager.fetchResultInModel(word: word) { [weak self] wordModel in
            guard let wordModel = wordModel else { return }
            self?.wordModel = wordModel
        }
    }
}
