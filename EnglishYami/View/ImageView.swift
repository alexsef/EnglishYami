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
        Image(uiImage: viewModel.image ?? ImageView.defaultImage!)
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
    
    static var defaultImage = UIImage(named: "document_icon")
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
