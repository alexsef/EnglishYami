//
//  model.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 01.11.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import Foundation

struct UnpreparedWordModel: Decodable {
    let id: Int
    let text: String
    let meanings: [Meaning]
}

struct Meaning: Decodable {
    let translation: Translation
    let imageUrl: String
}

struct Translation: Decodable {
    let text: String
}

struct Word: Hashable, Identifiable {
    let id: Int
    let text: String
    let translatedText: String
    let imageUrl: String
}
