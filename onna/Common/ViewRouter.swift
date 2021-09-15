//
//  ViewRouter.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import Foundation

class ViewRouter: ObservableObject {
    
    @Published var previousPage: Page = .profileView
    @Published var currentPage: Page = .profileView
    
}
