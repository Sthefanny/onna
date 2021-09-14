//
//  Favoritos.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 14/09/21.
//

import SwiftUI

struct Favoritos: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    var _buildFirstContentLine: some View {
        HStack {
            Image("GirlPower-Home")
                .resizable()
                .frame(width: 150, height: 140)
                .padding(8)
            Image("BodyPositive-Home")
                .resizable()
                .frame(width: 150, height: 140)
                .padding(8)
        }
    }
}

struct Favoritos_Previews: PreviewProvider {
    static var previews: some View {
        Favoritos()
    }
}
