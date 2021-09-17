//
//  DynamicResultModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import Foundation

struct DynamicResult: Decodable {
    let id: Int
    let journeyId: Int
    let userId: Int
    let entityId: Int
    let entityName: String
    let answer: String
}
