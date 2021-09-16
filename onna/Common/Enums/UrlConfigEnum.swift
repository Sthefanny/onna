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
    case loginUrl = "/auth/login"
    case journeyUrl = "/journey"
    case journeyIdUrl = "/journey/{id}"
    case challengeUrl = "/challenge"
    case challengeIdUrl = "/challenge/{id}"
    case blogUrl = "/blog"
    case blogIdUrl = "/blog/{id}"
    case quizUrl = "/quiz"
    case quizIdUrl = "/quiz/{id}"
    case dynamicResultUrl = "/dynamic-results"
    case dynamicResultIdUrl = "/dynamic-results/{id}"
    case storyUrl = "/story"
    case storyIdUrl = "/story/{id}"

    var text: String {
        return self.rawValue
    }
}

