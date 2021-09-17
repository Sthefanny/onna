//
//  StoryModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import Foundation

struct Story: Decodable, Identifiable {
    let id: Int
    let story: String
}
