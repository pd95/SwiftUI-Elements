//
//  ViewModel.swift
//  SwiftUI-Elements
//
//  Created by Philipp on 28.01.21.
//

import Foundation

enum Screen: Hashable, CaseIterable, CustomStringConvertible {
    case welcome, basicForm, list
    
    var description: String {
        switch self {
        case .welcome:
            return "Welcome"
        case .basicForm:
            return "Basic Form"
        case .list:
            return "List"
        }
    }
    
    var iconName: String? {
        switch self {
        case .welcome:
            return "gift"
        case .basicForm:
            return "heart.text.square"
        case .list:
            return "list.bullet.rectangle"
        }
    }
}

class ViewModel: ObservableObject {
    @Published var selectedScreen: Screen?

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
