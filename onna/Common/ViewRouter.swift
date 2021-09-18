//
//  ViewRouter.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import Foundation

class ViewRouter: ObservableObject {
    
    @Published var previousPage: Page = .onBoarding01View
    @Published var currentPage: Page = .onBoarding01View
    @Published var parameter: Any?
    
}
