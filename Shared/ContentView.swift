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
            NavigationSidebar(selection: $model.selectedScreen) { screen in
                switch screen {
                default:
                    PlaceholderView(screen: screen)
                }
            }

            #if os(macOS)
            PlaceholderView(screen: model.selectedScreen)
            #endif
        }
        .environmentObject(model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
