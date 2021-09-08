//
//  onnaApp.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 01/09/21.
//

import SwiftUI

@main
struct onnaApp: App {
    @StateObject var viewRouter = ViewRouter()
        
    var body: some Scene {
        WindowGroup {
            NavigationView().environmentObject(viewRouter)
        }
    }
}
