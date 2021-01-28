//
//  ViewModel.swift
//  SwiftUI-Elements
//
//  Created by Philipp on 28.01.21.
//

import Foundation

enum Screen: Hashable, CaseIterable, CustomStringConvertible {
    case welcome, fontStyles, basicControls, list
    
    var description: String {
        switch self {
        case .welcome:
            return "Welcome"
        case .fontStyles:
            return "Text & Styles"
        case .basicControls:
            return "Controls"
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
        case .list:
            return "list.bullet.rectangle"
        }
    }
}

class ViewModel: ObservableObject {
    @Published var selectedScreen: Screen? = .fontStyles

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
