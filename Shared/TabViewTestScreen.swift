//
//  TabViewTestScreen.swift
//  SwiftUI-Elements
//
//  Created by Philipp on 02.02.21.
//

import SwiftUI

struct TabViewTestScreen: View {
    @State private var selectedTab = Screen.welcome
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(Screen.allCases, id: \.self) { screen in
                screen.mainView
                    .tabItem {
                        Label(screen.description, systemImage: screen.iconName ?? "")
                    }
                    .tag(screen)
            }
        }
        .padding()
    }
}

struct TabViewTestScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabViewTestScreen()
    }
}
