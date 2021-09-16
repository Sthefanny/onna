//
//  QuizModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import Foundation

struct Quiz: Decodable, Identifiable {
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
