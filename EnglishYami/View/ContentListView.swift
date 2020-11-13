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
    
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        Group {
            VStack(alignment: .leading) {
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Введите слово", text: $viewModel.text)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(Color.white)
                .clipShape(Capsule())

                WordListView(words: viewModel.words)
                Spacer()
            }
            .padding([.leading, .trailing])
        }
        .padding(.top, 10)
        
        
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListView()
    }
}
