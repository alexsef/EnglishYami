//
//  URLImageViewModel.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 03.11.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import Foundation
import SwiftUI

protocol ImageViewModelProtocol: ObservableObject {
    func fetchImage(urlString: String)
}

class URLImageViewModel: ImageViewModelProtocol {
    
    let networkManager = NetworkManager()
    
    @Published var image: UIImage?
    
    func loadImage(urlString: String) {
        let preparedUrlString = prepareURLString(urlString: urlString)
        fetchImage(urlString: preparedUrlString)
    }
    
    func prepareURLString(urlString: String) -> String {
        var urlString = urlString
        urlString.removeFirst(min(urlString.count, 2))
        return "https://\(urlString)"
    }
    
    func fetchImage(urlString: String) {
        networkManager.getImage(urlString: urlString) { [weak self] image in
            self?.image = image
        }
    }
}
