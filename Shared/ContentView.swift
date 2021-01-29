//
//  ContentView.swift
//  Shared
//
//  Created by Philipp on 27.01.21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = ViewModel()
    
    var body: some View {
        NavigationView {
            NavigationSidebar(selection: $model.selectedScreen, content: mainView(for: ))

            #if os(macOS)
            if let screen = model.selectedScreen {
                mainView(for: screen)
            }
            #endif
        }
        .environmentObject(model)
    }
    
    func mainView(for screen: Screen) -> some View {
        Group {
            switch screen {
            case .fontStyles:
                TextFontScreen()
            case .basicControls:
                BasicControlsScreen()
            case .navigation:
                NavigationTestScreen()
            default:
                PlaceholderView(screen: screen)
            }
        }
        .navigationTitle(screen.description)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
