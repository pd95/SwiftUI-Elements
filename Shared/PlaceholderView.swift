//
//  PlaceholderView.swift
//  SwiftUI-Elements
//
//  Created by Philipp on 28.01.21.
//

import SwiftUI

struct PlaceholderView: View {
    @EnvironmentObject var model: ViewModel

    let screen: Screen?

    var body: some View {
        VStack {
            Text("An app to explore SwiftUI elements")
                .font(.largeTitle)
                .padding()

            if let selectedScreen = screen {
                Text("Selected screen: \(selectedScreen.description)")
                
                Button("Jump to Navigation", action: {
                    model.gotoScreen(.navigation)
                })
                Button("Clear selection", action: {
                    model.gotoScreen(.welcome)
                })
            }

            Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.")
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle(screen?.description ?? "Startup")
    }
}


struct NavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView(screen: .basicControls)
    }
}
