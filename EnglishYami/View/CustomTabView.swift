//
//  CustomTabView.swift
//  EnglishYami
//
//  Created by Алексей Селиванов on 13.11.2020.
//  Copyright © 2020 Alexey Selivanov. All rights reserved.
//

import SwiftUI

struct CustomTabView: View {
    
    @State var selectedTab = "house"
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    var tabs = ["house", "list.bullet", "gear"]
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $selectedTab) {
                ContentListView()
                    .tag("house")
                
                CardsView()
                    .tag("list.bullet")
                
                Settings()
                    .tag("gear")
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { image in
                    TabButton(image: image, selectedTab: $selectedTab)
                    
                    if image != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 5)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
            .padding(.bottom, edge!.bottom == 0 ? 20 : 0)
            .padding([.leading, .trailing])
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
}

struct TabButton: View {
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {selectedTab = image}) {
            Image(systemName: image)
                .renderingMode(.template)
                .foregroundColor(selectedTab == image ? Color.blue : Color.black.opacity(0.4))
                .padding()
        }
    }
}

struct CardsView: View {
    var body: some View {
        Text("Here will be cards...")
    }
}

struct Settings: View {
    var body: some View {
        Text("Here will be settings...")
    }
}
