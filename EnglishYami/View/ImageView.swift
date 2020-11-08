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
    
    init(urlString: String) {
        viewModel.loadImage(urlString: urlString)
    }
    
    var body: some View {
        if let image = viewModel.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.white)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(urlString: "//google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D_60rAgaoA6s&psig=AOvVaw0rfTCsXhjmXtVahLlRX70V&ust=1604908226862000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPiunNy68uwCFQAAAAAdAAAAABAD")
    }
}
