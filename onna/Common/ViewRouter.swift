//
//  ViewRouter.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import Foundation

class ViewRouter: ObservableObject {
    
    @Published var previousPage: Page = .splashScreenView
    @Published var currentPage: Page = .splashScreenView
    @Published var parameter: Any?
    @Published var parameter2: Any?
    @Published var parameter3: Any?
    @Published var parameter4: Any?
    
}
