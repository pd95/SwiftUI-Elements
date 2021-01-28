//
//  LabelAlignment.swift
//  SwiftUI-Elements
//
//  Created by Philipp on 28.01.21.
//

import SwiftUI

extension HorizontalAlignment {
    private enum LabelAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.width
        }
    }
    
    static let labelAlignment = HorizontalAlignment(LabelAlignment.self)
    
    private enum ElementAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.width
        }
    }
    
    static let elementAlignment = HorizontalAlignment(ElementAlignment.self)
}
