//
//  UserDefaultsKeysEnum.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import Foundation

enum UserDefaultsKeys: String {
    case userId = "userId"
    case email = "email"
    case nickName = "nickName"
    case firstName = "firstName"
    case lastName = "lastName"
    case isLogged = "isLogged"

    var name: String {
        return self.rawValue
    }
}
