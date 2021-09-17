//
//  BlogModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import Foundation

struct Blog: Decodable {
    let id: Int
    let journeyId: Int
    let icon: String
    let title: String
    let page: String
}
