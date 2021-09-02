//
//  ContentView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 01/09/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Timeline")
            .onnaFont(.subheadline)
            .foregroundColor(.onnaYellow)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
