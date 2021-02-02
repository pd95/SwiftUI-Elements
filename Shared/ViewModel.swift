//
//  ViewModel.swift
//  SwiftUI-Elements
//
//  Created by Philipp on 28.01.21.
//

import SwiftUI

enum Screen: Hashable, CaseIterable, CustomStringConvertible {
    case welcome, fontStyles, basicControls, navigation, tabview, list
    
    var description: String {
        switch self {
        case .welcome:
            return "Welcome"
        case .fontStyles:
            return "Text & Styles"
        case .basicControls:
            return "Controls"
        case .navigation:
            return "Navigation"
        case .tabview:
            return "Tabs"
        case .list:
            return "List"
        }
    }
    
    var iconName: String? {
        switch self {
        case .welcome:
            return "gift"
        case .fontStyles:
            return "textformat"
        case .basicControls:
            return "heart.text.square"
        case .navigation:
            return "chevron.right.square"
        case .tabview:
            return "rectangle.stack"
        case .list:
            return "list.bullet.rectangle"
        }
    }

    @ViewBuilder
    var mainView: some View {
        Group {
            switch self {
            case .fontStyles:
                TextFontScreen()
            case .basicControls:
                BasicControlsScreen()
            case .navigation:
                NavigationTestScreen()
            case .tabview:
                TabViewTestScreen()
            default:
                PlaceholderView(screen: self)
            }
        }
        .navigationTitle(self.description)
    }
}

class ViewModel: ObservableObject {
    @Published var selectedScreen: Screen? = .navigation

    func gotoScreen(_ screen: Screen?) {
        #if os(iOS)
        selectedScreen = nil
        if screen != nil {
            DispatchQueue.main.async {
                self.selectedScreen = screen
            }
        }
        #else
        selectedScreen = screen
        #endif
    }
}
