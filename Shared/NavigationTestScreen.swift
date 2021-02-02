//
//  NavigationTestScreen.swift
//  SwiftUI-Elements
//
//  Created by Philipp on 29.01.21.
//

import SwiftUI

struct NavigationTestScreen: View {
    
    @State private var selectedStyle = MyNavigationViewStyles.default
    @State private var selectedScreen: Screen?

    var body: some View {
        NavigationView {
            MainView(selectedStyle: $selectedStyle, selectedScreen: $selectedScreen)
            ChooseStyleView(selectedStyle: $selectedStyle)
        }
        .myNavigationViewStyle(selectedStyle)
    }

    // MARK: - Helper views
    struct ChooseStyleView: View {
        @Binding var selectedStyle: MyNavigationViewStyles

        var body: some View {
            Text("Testing how a NavigationLink looks.")

            Picker("Choose style:", selection: $selectedStyle) {
                ForEach(MyNavigationViewStyles.allCases.filter({$0.isAvailable})) { style in
                    Text(String(describing: style))
                        .tag(style)
                }
            }
            .pickerStyle(InlinePickerStyle())
            .frame(maxWidth: 250)
        }
    }

    struct MainView: View {
        @Binding var selectedStyle: MyNavigationViewStyles
        @Binding var selectedScreen: Screen?

        var body: some View {
            List {
                ForEach(Screen.allCases, id: \.self) { screen in
                    NavigationLink(
                        destination: screen.mainView.navigationTitle(screen.description),
                        tag: screen,
                        selection: $selectedScreen
                    ) {
                        Label(screen.description, systemImage: screen.iconName ?? "")
                    }
                }

                Spacer()
                ChooseStyleView(selectedStyle: $selectedStyle)
                Spacer()
            }
        }
    }
}

struct NavigationTestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTestScreen()
    }
}

// MARK: - Helper type and extension to apply navigation view style
public enum MyNavigationViewStyles: Int, Hashable, Identifiable, CaseIterable {
    case `default`, stack, doubleColumn
    
    public var id: Int { rawValue }
    
    var isAvailable: Bool {
        switch self {
        case .stack:
            #if os(iOS)
            return true
            #else
            return false
            #endif
        default:
            return true
        }
    }
}

extension View {
    public func myNavigationViewStyle(_ style: MyNavigationViewStyles = .default) -> AnyView {
        #if os(iOS)
        if style == .stack {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        }
        #endif
        if style == .doubleColumn {
            return AnyView(self.navigationViewStyle(DoubleColumnNavigationViewStyle()))
        }
        else {
            return AnyView(self.navigationViewStyle(DefaultNavigationViewStyle()))
        }
    }
}

