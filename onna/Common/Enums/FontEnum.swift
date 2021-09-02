//
//  FontEnum.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 02/09/21.
//

import Foundation

enum Font: String {
    case brunoRegular = "MADEBruno"
    case chivoRegular = "chivo-regular"
    case chivoBold = "chivo-bold"

    var name: String {
        return self.rawValue
    }
}
