//
//  UserDefaultsKeysEnum.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import Foundation

enum UserDefaultsKeys: String {
    case idUsuario = "idUsuario"
    case userId = "userId" //password
    case email = "email"
    case nickName = "nickName"
    case firstName = "firstName"
    case lastName = "lastName"
    case isLogged = "isLogged"
    case accessToken = "accessToken"
    case refreshToken = "refreshToken"
    case actualQuizes = "actualQuizes"
    case hasViewedTutorialDiscovery = "hasViewedTutorialDiscovery"
    case hasViewedTutorialCommunity = "hasViewedTutorialCommunity"
    case hasViewedTutorialJourney = "hasViewedTutorialJourney"

    var name: String {
        return self.rawValue
    }
}
