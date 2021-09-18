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
    case challengeUrl = "/challenge"
    case blogUrl = "/blog"
    case quizUrl = "/quiz"
    case quizQuestionUrl = "/quiz-question/getbyindex"
    case dynamicResultUrl = "/dynamic-results"
    case storyUrl = "/story"

    var text: String {
        return self.rawValue
    }
}

