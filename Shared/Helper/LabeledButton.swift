//
//  LabeledButton.swift
//  SwiftUI-Elements
//
//  Created by Philipp on 28.01.21.
//

import SwiftUI

struct LabeledButton<ChosenStyle: PrimitiveButtonStyle>: View {
    let style: ChosenStyle
    let title: String
    let subtitle: String?
    let label: String
    let action: () -> Void
    
    init(_ style: ChosenStyle, title: String, subtitle: String? = nil, label: String? = nil, action: @escaping () -> Void = {}) {
        self.style = style
        self.title = title
        self.subtitle = subtitle
        self.label = label ?? "Text label"
        self.action = action
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            FormLabel(title, subtitle: subtitle)

            Button(label, action: action)
                .buttonStyle(style)
                .frame(maxWidth: 150)
                .alignmentGuide(.labelAlignment, computeValue: { dimension in
                    dimension[HorizontalAlignment.center]
                })
        }
    }
}


struct LabeledButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .labelAlignment) {
            LabeledButton(PlainButtonStyle(),
                          title: "PlainButtonStyle:", subtitle: "no styling applied")
            
            LabeledButton(BorderlessButtonStyle(),
                          title: "BorderlessButtonStyle:")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
