//
//  NavigationSidebar.swift
//  SwiftUI-Elements
//
//  Created by Philipp on 28.01.21.
//

import SwiftUI

struct NavigationSidebar<Content: View>: View {
    @Binding var selection: Screen?

    let content: (Screen) -> Content

    init(selection: Binding<Screen?>, @ViewBuilder content: @escaping (Screen) -> Content) {
        self._selection = selection
        self.content = content
    }
    
    var body: some View {
        List(selection: $selection) {
            ForEach(Screen.allCases, id: \.self) { screen in
                #if os(iOS)
                // On iOS we have to use NavigationLink to link from the sidebar to a detail screen
                // Programmatic navigation seems to be broken in iOS: the selection in the list is not following the $selection binding.
                NavigationLink(destination: content(screen),
                               tag: screen,
                               selection: $selection) {
                    row(for: screen)
                }
                #else
                row(for: screen)
                #endif
            }
        }
        .listStyle(SidebarListStyle())
    }
    
    func row(for screen: Screen) -> some View {
        Group {
            if let icon = screen.iconName {
                Label(screen.description, systemImage: icon)
            }
            else {
                Text(screen.description)
            }
        }
        .tag(screen)
    }
}
