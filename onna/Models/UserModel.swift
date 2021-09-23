//
//  UserModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 13/09/21.
//

import Foundation

struct User: Decodable {
    let id: Int?
    let image: String?
    let firstName: String?
    let lastName: String?
    let email: String
    let password: String
    let birthDate: String?
    let insta: String?
    let phrase: String?
    let deviceId: String?
    let version: String?
    let so: String?
    var token: Token?
}

struct Token: Decodable {
    let accessToken: String
    let refreshToken: String
}
