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
    
    @State var showMenu = false
    
    var body: some View {
        NavigationView {
            CustomTabView()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
