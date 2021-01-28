//
//  TextFontScreen.swift
//  SwiftUI-Elements
//
//  Created by Philipp on 28.01.21.
//

import SwiftUI

struct TextFontScreen: View {
    
    let template = "\n    AaBbCc 0123"
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HStack(alignment: .top) {
                    GroupBox(label: Label("Text styles/Fonts", systemImage: "textformat")) {
                        HStack(alignment: .top) {
                            VStack {
                                Text(".largeTitle")
                                    .font(.largeTitle)
                                Text(".title")
                                    .font(.title)
                                Text(".title2")
                                    .font(.title2)
                                Text(".title3")
                                    .font(.title3)
                                Text(".headline")
                                    .font(.headline)
                                Text(".subheadline")
                                    .font(.subheadline)
                                Text(".body")
                                    .font(.body)
                                Text(".callout")
                                    .font(.callout)
                                Text(".caption")
                                    .font(.caption)
                                Text(".caption2")
                                    .font(.caption2)
                            }
                            .fixedSize()

                            VStack {
                                Text("regular .body style\(template)")
                                Text(".bold()\(template)")
                                    .font(Font.body.bold())
                                Text(".italic()\(template)")
                                    .font(Font.body.italic())
                                Text(".monospacedDigit()\(template)")
                                    .font(Font.body.monospacedDigit())
                                Text(".smallCaps()\(template)")
                                    .font(Font.body.smallCaps())
                                Text(".lowercaseSmallCaps()\(template)")
                                    .font(Font.body.lowercaseSmallCaps())
                                Text(".uppercaseSmallCaps()\(template)")
                                    .font(Font.body.uppercaseSmallCaps())
                            }
                            .fixedSize()

                            VStack {
                                Text(".fontWeight(.none)\(template)")
                                    .fontWeight(.none)
                                Text(".fontWeight(.black)\(template)")
                                    .fontWeight(.black)
                                Text(".fontWeight(.bold)\(template)")
                                    .fontWeight(.bold)
                                Text(".fontWeight(.light)\(template)")
                                    .fontWeight(.light)
                                Text(".fontWeight(.medium)\(template)")
                                    .fontWeight(.medium)
                                Text(".fontWeight(.regular)\(template)")
                                    .fontWeight(.regular)
                                Text(".fontWeight(.semibold)\(template)")
                                    .fontWeight(.semibold)
                                Text(".fontWeight(.thin)\(template)")
                                    .fontWeight(.thin)
                                Text(".fontWeight(.ultraLight)\(template)")
                                    .fontWeight(.ultraLight)
                            }
                            .fixedSize()
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct TextScreen_Previews: PreviewProvider {
    static var previews: some View {
        BasicControlsScreen()
            .previewLayout(.sizeThatFits)
    }
}
