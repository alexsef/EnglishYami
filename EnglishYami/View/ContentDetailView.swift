//
//  MainContentView.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 05.11.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import SwiftUI

struct ContentDetailView: View {
    
    @State var searchFieldText = ""
    
    @ObservedObject var viewModel = ResponseViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Введите слово", text: $searchFieldText, onEditingChanged: { focused in
                if focused, let _ = viewModel.wordModel {
                    viewModel.wordModel = nil
                }
            }, onCommit: {
                viewModel.getResponseFromNetwork(word: searchFieldText)
            }
            ).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            ImageView(urlString: viewModel.wordModel?.meanings[0].imageUrl) // hardcode
            Text(viewModel.wordModel?.meanings[0].translation.text ?? "") // to do: remove this hardcode
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
        }.padding()
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
