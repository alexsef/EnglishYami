//
//  ContentView.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 30.10.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var viewModel = ResponseViewModel()
    @State var searchFieldText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Введите слово", text: $searchFieldText, onCommit: {
                viewModel.getResponseFromNetwork(word: searchFieldText)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            Text(viewModel.wordModel?.meanings[0].translation.text ?? "")
            ImageView(urlString: viewModel.wordModel?.meanings[0].imageUrl)
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
