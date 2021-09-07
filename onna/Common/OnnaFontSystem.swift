//
//  DesignSystem.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 02/09/21.
//

import Foundation
import SwiftUI



struct OnnaFontSystem: ViewModifier {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    public enum TextStyle {
        case largeTitle //Bruno, 34pt, Regular
        case title1 //Bruno, 22pt, Regular
        case title2 //Bruno, 17pt, Regular
        case body //Chivo, 17pt, Regular
        case subheadline //Chivo, 17pt, Bold
        case callout //Chivo, 15pt, Regular
    }
    
    var textStyle: TextStyle
    var textSize: CGFloat?

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: textSize ?? size)
       return content.font(.custom(fontName, size: scaledSize))
    }
    
    private var fontName: String {
        switch textStyle {
        case .largeTitle, .title1, .title2:
            return Font.brunoRegular.rawValue
        case .body, .callout:
            return Font.chivoRegular.rawValue
        case .subheadline:
            return Font.chivoBold.rawValue
        }
    }
    
    private var size: CGFloat {
        switch textStyle {
        case .largeTitle:
            return 34
        case .title1:
            return 22
        case .title2, .body, .subheadline:
            return 17
        case .callout:
            return 15
        }
    }
}

extension View {
    
    func onnaFont(_ textStyle: OnnaFontSystem.TextStyle, textSize: CGFloat? = nil) -> some View {
        self.modifier(onna.OnnaFontSystem(textStyle: textStyle, textSize: textSize))
    }
}
