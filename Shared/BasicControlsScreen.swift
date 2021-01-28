//
//  BasicFormScreen.swift
//  SwiftUI-Elements
//
//  Created by Philipp on 28.01.21.
//

import SwiftUI

struct BasicControlsScreen: View {
    
    @State private var toggleValue = true
    @State private var sliderValue = 15.0
    @State private var stepperValue = 5
    @State private var pickerValue: Screen? = .welcome
    @State private var dateValue = Date(timeIntervalSinceReferenceDate: 0)
    @State private var colorValue = Color.blue

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                GroupBox(label: Label("Buttons & styles", systemImage: "square.grid.2x2")) {
                    buttonStyles
                }

                GroupBox(label: Label("Controls & Pickers", systemImage: "square.grid.2x2")) {
                    controlViews
                }
            }
            
            HStack(alignment: .top) {
                GroupBox(label: Label("Textfields", systemImage: "textbox")) {
                    textfields
                }
                
                GroupBox(label: Label("Textfield styles", systemImage: "textbox")) {
                    textfieldStyles
                }
            }
        }
        .padding()
    }
    
    var buttonStyles: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .labelAlignment, spacing: 10) {

                LabeledButton(PlainButtonStyle(),
                              title: "PlainButtonStyle:", subtitle: "no styling applied")
                
                LabeledButton(BorderlessButtonStyle(),
                              title: "BorderlessButtonStyle:")

                #if os(macOS)
                LabeledButton(LinkButtonStyle(),
                              title: "LinkButtonStyle:")
                
                LabeledButton(BorderedButtonStyle(),
                              title: "BorderedButtonStyle:")

                #elseif os(tvOS)
                LabeledButton(CardButtonStyle(),
                              title: "CardButtonStyle:")

                #endif

                LabeledControl(title: "Menu:") {
                    Menu("Actions") {
                        Button("Duplicate", action: {})
                        Button("Rename", action: {})
                        Button("Delete…", action: {})
                        Menu("Copy") {
                            Button("Copy", action: {})
                            Button("Copy Formatted", action: {})
                            Button("Copy Library Path", action: {})
                        }
                    }
                    .frame(maxWidth: 150)
                    .alignmentGuide(.labelAlignment, computeValue: { dimension in
                        dimension[HorizontalAlignment.center]
                    })
                }

                LabeledControl(title: "Link:") {
                    Link("Open URL", destination: URL(string: "https://www.apple.com")!)
                        .frame(maxWidth: 150)
                        .alignmentGuide(.labelAlignment, computeValue: { dimension in
                            dimension[HorizontalAlignment.center]
                        })
                }
            }
        }
    }
    
    var controlViews: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .labelAlignment, spacing: 10) {

                LabeledControl(title: "Toggle:") {
                    Toggle("Tick the box", isOn: $toggleValue)
                }

                LabeledControl(title: "Slider:") {
                    Slider(value: $sliderValue, in: 0...30,
                           minimumValueLabel: Text("0"),
                           maximumValueLabel: Text("30")) {
                        EmptyView()
                    }
                    .frame(maxWidth: 250)
                }

                LabeledControl(title: "Stepper:") {
                    Stepper(value: $stepperValue, in: 0...15,
                            step: 1) {
                        Text("\(stepperValue)")
                    }
                }
                
                LabeledControl(title: "Picker:") {
                    Picker("Screen", selection: $pickerValue) {
                        ForEach(Screen.allCases, id: \.self) { screen in
                            Text(screen.description)
                        }
                    }
                    .frame(maxWidth: 250)
                }

                LabeledControl(title: "DatePicker:") {
                    DatePicker("Start Date", selection: $dateValue)
                        .frame(maxWidth: 250)
                }

                LabeledControl(title: "ColorPicker:") {
                    ColorPicker("Text Color", selection: $colorValue)
                        .alignmentGuide(.firstTextBaseline, computeValue: { dimension in
                            dimension[VerticalAlignment.center] + 5
                        })
                }
            }
        }
    }
    
    var textfields: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .labelAlignment, spacing: 10) {
                LabeledControl(title: "TextField:") {
                    TextField("Placeholder", text: .constant("Please type here"))
                        .frame(maxWidth: 200)
                }
                LabeledControl(title: "SecureField:") {
                    SecureField("Placeholder", text: .constant("Secret"))
                        .frame(maxWidth: 200)
                }
                LabeledControl(title: "TextEditor:") {
                    TextEditor(text: .constant("This is a multiline text field. You could write about Lorem Ipsum to fill in a lot of text...\nOr just: the quick brown fox jumps over the lazy dog."))
                        .frame(maxWidth: 200, minHeight: 80)
                        .alignmentGuide(.firstTextBaseline, computeValue: { dimension in
                            dimension[.top] + 20
                        })
                }
            }
        }
    }
    
    var textfieldStyles: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .labelAlignment, spacing: 10) {
                LabeledTextField(PlainTextFieldStyle(),
                                 title: "PlainTextFieldStyle:")
                
                LabeledTextField(RoundedBorderTextFieldStyle(),
                                 title: "RoundedBorderTextFieldStyle:")
                
                #if os(macOS)
                LabeledTextField(SquareBorderTextFieldStyle(),
                                 title: "SquareBorderTextFieldStyle:")
                #endif
            }
        }
    }
}

struct BasicFormScreen_Previews: PreviewProvider {
    static var previews: some View {
        BasicControlsScreen()
            .previewLayout(.sizeThatFits)
    }
}
