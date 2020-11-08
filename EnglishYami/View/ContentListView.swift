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
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                TextField("Введите слово", text: $searchFieldText, onEditingChanged: { focused in
                    if focused {
                        viewModel.words = []
                    }
                }, onCommit: {
                    viewModel.getResponseFromNetwork(word: searchFieldText)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.trailing)
            }
            .padding([.top, .bottom])
            .background(Color(red: 32/255, green: 32/255, blue: 32/255, opacity: 0.1))

            WordListView(words: viewModel.words)
            Spacer()
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListView()
    }
}
