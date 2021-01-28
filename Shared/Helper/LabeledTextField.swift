//
//  LabeledTextField.swift
//  SwiftUI-Elements
//
//  Created by Philipp on 28.01.21.
//

import SwiftUI

struct LabeledTextField<ChosenStyle: TextFieldStyle>: View {
    let style: ChosenStyle
    let title: String
    let subtitle: String?
    let placeholder: String

    @State private var text = ""

    init(_ style: ChosenStyle, title: String, subtitle: String? = nil, placeholder: String? = nil, action: @escaping () -> Void = {}) {
        self.style = style
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder ?? "Placeholder"
    }

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            FormLabel(title, subtitle: subtitle)

            TextField(placeholder, text: $text)
                .textFieldStyle(style)
                .frame(maxWidth: 200)
                .alignmentGuide(.labelAlignment, computeValue: { dimension in
                    dimension[HorizontalAlignment.leading]
                })
        }
    }
}

struct LabeledTextfield_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .labelAlignment) {
            LabeledTextField(PlainTextFieldStyle(),
                             title: "PlainTextFieldStyle:")
            
            LabeledTextField(RoundedBorderTextFieldStyle(),
                             title: "RoundedBorderTextFieldStyle:")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
