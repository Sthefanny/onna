//
//  BlogModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import Foundation

struct Blog: Decodable, Identifiable {
    let id: Int
    let journeyId: Int
    let icon: String
    let title: String
    let page: String
}

struct BlogResponse: Decodable, Identifiable {
    let id: Int
    let title: String
    let page: String
    let completed: Bool
}
