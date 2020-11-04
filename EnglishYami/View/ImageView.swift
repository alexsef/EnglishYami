//
//  ImageView.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 03.11.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import SwiftUI
import Combine

struct ImageView: View {
    
    @ObservedObject var viewModel = URLImageViewModel()
    
    init(urlString: String? = nil) {
        guard let urlString = urlString else { return }
        viewModel.loadImage(urlString: urlString)
    }
    
    var body: some View {
        if let image = viewModel.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        
    }
    
//    static var defaultImage = UIImage(named: "document_icon")
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
