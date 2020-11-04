//
//  MainView.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 04.11.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = ResponseViewModel()
    @State var searchFieldText = ""
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Введите слово", text: $searchFieldText, onCommit: {
                viewModel.getResponseFromNetwork(word: searchFieldText)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            ImageView(urlString: viewModel.wordModel?.meanings[0].imageUrl)
            Text(viewModel.wordModel?.meanings[0].translation.text ?? "")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Spacer()
        }.padding()
    }
}
