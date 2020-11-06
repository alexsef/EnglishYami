//
//  MainContentView.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 05.11.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import SwiftUI

struct ContentListView: View {
    
    @State var searchFieldText = ""
    
    @ObservedObject var viewModel = ResponseViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            TextField("Введите слово", text: $searchFieldText, onEditingChanged: { focused in
                if focused {
                    viewModel.words = []
                }
            }, onCommit: {
                viewModel.getResponseFromNetwork(word: searchFieldText)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            Spacer()
            WordListView(words: viewModel.words)
//            ImageView(urlString: viewModel.wordModels?.meanings[0].imageUrl) // hardcode
//            Text(viewModel.wordModels?.meanings[0].translation.text ?? "") // to do: remove this hardcode
//                .font(.title)
//                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListView()
    }
}
