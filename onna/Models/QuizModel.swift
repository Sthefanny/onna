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
    let icon: String
    let title: String
    let description: String
    let image: String
    let imageType: String
    let positiveResult: String
    let negativeResult: String
}

struct QuizQuestion: Decodable, Identifiable {
    let id: Int
    let quizId: Int
    let index: Int
    let text: String
}

struct QuizAnswer: Decodable, Identifiable {
    let id: Int
    let quizQuestionId: Int
    let text: String
    let isCorrect: Bool
}
