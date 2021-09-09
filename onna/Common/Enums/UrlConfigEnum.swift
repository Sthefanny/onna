//
//  UrlConfig.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 08/09/21.
//

import Foundation

enum UrlConfig: String {
    case baseUrl = "https://onna-api.herokuapp.com"
    case authUrl = "/auth"
    case journeyUrl = "/journey"
    case journeyIdUrl = "/journey/{id}"

    var text: String {
        return self.rawValue
    }
}

