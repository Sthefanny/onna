//
//  ContentColorEnum.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import Foundation
import SwiftUI

enum ContentColorEnum {
    case blog
    case challenge
    case quiz
}


func getColorByContent (value: ContentColorEnum) -> Color {
    switch value {
    case .blog:
        return .onnaPink
    case .challenge:
        return .onnaGreen
    case .quiz:
        return .onnaYellow
    }
}
