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
    
    @ObservedObject var viewModel = TranslateViewModel()
    @State var searchFieldText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Bla-bla").bold()
            TextField("Введите слово", text: $searchFieldText, onCommit: {
                viewModel.fetchTranslate(word: searchFieldText)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            Text(viewModel.translateText)
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
