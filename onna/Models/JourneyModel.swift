//
//  JourneyModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 08/09/21.
//

import Foundation

struct Journey: Decodable, Identifiable {
    let id: Int
    let image: String
    let title: String
    let description: String
    let challenge: Challenge?
    let blog: Blog?
    let quiz: Quiz?
    let dynamicResults: [DynamicResult]?
}

struct JourneyWithContent: Decodable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let image: String
    let blog: BlogResponse?
    let challenge: ChallengeResponse?
    let quiz: QuizResponse?
}

struct ContentHasLike: Decodable {
    let exist: Bool
}

struct ContentLiked: Decodable {
    let journeyId: Int
    let entityId: Int
    let entityName: String
    let image: String
    let text: String
}

//let sampleJourney = Journey(id: 1,
//                            image: "image.jpg",
//                            title: "Jornada 01",
//                            description: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.",
//                            challenges: nil,
//                            blogs: nil,
//                            quizes: nil,
//                            dynamicResults: nil)
