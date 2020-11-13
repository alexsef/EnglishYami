//
//  DetailWord.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 08.11.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import SwiftUI

struct DetailWord: View {
    
    let word: Word
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                if #available(iOS 14.0, *) {
                    ProgressView().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2.37, alignment: .center)
                }
                ImageView(urlString: word.imageUrl)
            }
            
            Group {
                Text(word.text).bold().font(.system(size: 40))
                Text(word.translatedText).lineLimit(1).font(.system(size: 20))
            }
            .lineLimit(1).foregroundColor(.white)
            .multilineTextAlignment(.leading)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40)
            .background(Color.blue.opacity(0.5))
            
            Spacer()
        }
        .navigationTitle(word.text)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailWord_Previews: PreviewProvider {
    
    static var previews: some View {
        let word = Word(id: 1, text: "Presenter", translatedText: "Ведущий", imageUrl: "//d2zkmv5t5kao9.cloudfront.net/images/afad03b48e72d600a2f1bb59ddb64777.jpeg?w=640&amp;h=480", previewUrl: "//d2zkmv5t5kao9.cloudfront.net/images/afad03b48e72d600a2f1bb59ddb64777.jpeg?w=96&amp;h=72", previewImage: UIImage(named: "tea"))
        
        DetailWord(word: word)
    }
}
