//
//  FormLabel.swift
//  SwiftUI-Elements
//
//  Created by Philipp on 28.01.21.
//

import SwiftUI

struct FormLabel: View {
    let title: String
    let subtitle: String?
    
    init(_ title: String, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            subtitle.map(Text.init)
                .font(.subheadline)
        }
        .alignmentGuide(.labelAlignment, computeValue: { dimension in
            dimension[.trailing]
        })
    }
}


struct FormLabel_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FormLabel("Title", subtitle: "Subtitle")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
