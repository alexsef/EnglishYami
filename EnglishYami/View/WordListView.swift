//
//  WordListView.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 06.11.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import SwiftUI

struct WordListView: View {
    
    var words: [Word]
    
    var body: some View {
        if !words.isEmpty {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(words) { word in
                        NavigationLink(destination: Text("\(word.text) \(word.translatedText)"), label: {
                            WordRow(word: word)
                        })
                    }
                }
            }
        }
    }
}

struct WordRow: View {
    
    let word: Word
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(radius: 1, y: 1)
                .frame(width: UIScreen.main.bounds.width - 32,
                       height: 100,
                       alignment: .leading)
            HStack {
                Image(uiImage: word.previewImage ?? UIImage())
                    .padding()
                
                VStack(alignment: .leading) {
                    Text(word.text)
                        .accentColor(.primary)
                        .padding([.top, .horizontal])
                        .font(.headline)
                    
                    Text(word.translatedText)
                        .accentColor(.primary)
                        .padding([.bottom, .horizontal])
                        .font(.subheadline)
                }
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.primary)
                    .padding(.trailing)
            }
        }.padding([.leading, .trailing])
    }
    
}


struct WordRow_Previews: PreviewProvider {
   
    static var previews: some View {
        let word: Word = Word(id: 1, text: "Something text", translatedText: "translated text", imageUrl: "some url", previewUrl: "https://d2zkmv5t5kao9.cloudfront.net/images/ea4f7ce85e73e44cec430fe87db3f3ce.jpeg?w=96&amp;h=72", previewImage: UIImage())
        
        return WordRow(word: word)
    }
}




