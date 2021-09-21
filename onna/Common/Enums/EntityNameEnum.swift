//
//  EntityNameEnum.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 19/09/21.
//

import Foundation

enum EntityNameEnum: String {
    case blog = "Blog"
    case challenge = "Challenge"
    case quiz = "Quiz"

    var name: String {
        return self.rawValue
    }
}
