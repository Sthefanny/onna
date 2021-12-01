//
//  SquaresAndLogoView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct SquaresAndLogoView: View {
    @State var actualSquare: Int
    @State var maxSquare: Int = 5
    @State var image: String
    @State var text: String
    @State var color: Color = .onnaWhite
    let size = UIScreen.main.bounds

    var body: some View {
        VStack(alignment: .leading) {
            _buildProgressionSquares
            _buildLogoAndName
        }
    }
    
    var _buildProgressionSquares: some View {
        HStack(alignment: .center, spacing: 15) {
            Spacer()
            ForEach(0 ..< maxSquare) { i in
                ProgressionSquareView(isActual: actualSquare == i)
            }
            Spacer()
        }
    }
    
    var _buildLogoAndName: some View {
        HStack(alignment: .center) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50, alignment: .center)
            Text(text)
                .onnaFont(.title2)
                .foregroundColor(color)
        }
        .padding(.leading, size.width * 0.1)
    }
}

struct SquaresAndLogoView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.onnaGreen.edgesIgnoringSafeArea(.all)
            SquaresAndLogoView(actualSquare: 1, image : "onna-logo", text : "onna")
        }
    }
}
