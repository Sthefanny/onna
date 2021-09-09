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
    let challenges: [Challenges]?
    let blogs: [Blogs]?
    let quizes: [Quizes]?
    let dynamicResults: [DynamicResults]?
}

struct Challenges: Decodable {
    let id: Int
    let journeyId: Int
    let title: String
    let description: String
    let tip: String
}

struct Blogs: Decodable {
    let id: Int
    let journeyId: Int
    let page: String
}

struct Quizes: Decodable {
    let id: Int
    let journeyId: Int
    let index: Int
    let title: String
    let description: String
    let image: String
    let imageType: String
    let positiveResult: String
    let negativeResult: String
}

struct DynamicResults: Decodable {
    let id: Int
    let journeyId: Int
    let userId: Int
    let entityId: Int
    let entityName: String
    let answer: String
}

let sampleJourney = Journey(id: 1,
                             image: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334",
                             title: "Jornada 01",
                             description: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.",
                             challenges: nil,
                             blogs: nil,
                             quizes: nil,
                             dynamicResults: nil)
