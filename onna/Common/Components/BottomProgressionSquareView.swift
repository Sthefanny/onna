//
//  BottomProgressionSquareView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import SwiftUI

struct BottomProgressionSquareView: View {
    @State var actualSquare: Int
    @State var maxSquare: Int = 3
    @State var color: Color = .white
    
    var body: some View {
        HStack {
            ForEach(0 ..< maxSquare) { i in
                ProgressionSquareView(isActual: actualSquare == i, color: color)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .padding(.bottom, -10)
    }
}

struct BottomProgressionSquareView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            ProgressionSquareView(isActual: true)
        }
    }
}
