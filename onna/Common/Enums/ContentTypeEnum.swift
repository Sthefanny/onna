//
//  ContentTypeEnum.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 17/09/21.
//

import Foundation

enum ContentType {
    case contentFeminism
    case contentBodyPositive
}



func getContentType (value: String) -> Page {
    switch value {
    case "feminismo":
        return .contentFeminismView
    case "body-positive":
        return .contentBodyPositiveView
    default:
        return .homeView
    }
}
