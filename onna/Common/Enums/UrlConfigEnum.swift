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
    case completedJourneyUrl = "/journey/listcompletedjourney"
    case likedJourneyUrl = "/journey/like"
    case contentHasLikeUrl = "/journey/existlike"
    case challengeUrl = "/challenge"
    case blogUrl = "/blog"
    case quizUrl = "/quiz"
    case quizQuestionUrl = "/quiz-question/getbyindex"
    case dynamicResultUrl = "/dynamic-results"
    case storyUrl = "/story"
    case postUrl = "/post"
    case postByUserUrl = "/post/listbyuser"
    case postWithComments = "/post/comment"
    case addCommentToPost = "/post/comment/save"
    case postLike = "/post/like"
    case userInfo = "/user/getuserinfo"
    case userUrl = "/user"

    var text: String {
        return self.rawValue
    }
}

