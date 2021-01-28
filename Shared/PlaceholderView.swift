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
                
                Button("Jump to List", action: {
                    model.gotoScreen(.list)
                })
                Button("Clear selection", action: {
                    model.gotoScreen(.welcome)
                })
            }
            Spacer()
        }
        .navigationTitle(screen?.description ?? "Startup")
    }
}


struct NavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView(screen: .basicControls)
    }
}
