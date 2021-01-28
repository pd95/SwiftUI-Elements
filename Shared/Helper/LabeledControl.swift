//
//  LabeledControl.swift
//  SwiftUI-Elements
//
//  Created by Philipp on 28.01.21.
//

import SwiftUI

struct LabeledControl<Content: View>: View {
    let title: String
    let subtitle: String?
    let content: () -> Content
        
    init(title: String, subtitle: String? = nil, content: @escaping () -> Content) {
        self.title = title
        self.subtitle = subtitle
        self.content = content
    }
        
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            FormLabel(title, subtitle: subtitle)

            content()
        }
    }
}

struct LabeledControl_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .labelAlignment) {
            LabeledControl(title: "Text:") {
                Text("Hello world")
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: 200, maxHeight: 100)
                    .alignmentGuide(.labelAlignment, computeValue: { dimension in
                        dimension[HorizontalAlignment.center]
                    })
            }
            LabeledControl(title: "TextEditor:") {
                TextEditor(text: .constant(""))
                    .frame(maxWidth: 200, maxHeight: 100)
                    .alignmentGuide(.labelAlignment, computeValue: { dimension in
                        dimension[HorizontalAlignment.center]
                    })
                    .alignmentGuide(.firstTextBaseline, computeValue: { dimension in
                        dimension[.top] + 20
                    })
            }
        }
        .padding()
        .background(Color(.lightGray))
        .previewLayout(.sizeThatFits)
    }
}
