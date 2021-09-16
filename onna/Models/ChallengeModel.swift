//
//  ChallengeModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import Foundation

struct Challenge: Decodable, Identifiable {
    let id: Int
    let journeyId: Int
    let title: String
    let description: String
    let tip: String
}
