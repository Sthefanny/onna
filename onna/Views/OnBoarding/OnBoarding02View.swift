//
//  OnBoarding02View.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct OnBoarding02View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    let size = UIScreen.main.bounds
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaPink.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                SquaresAndLogoView(actualSquare: 1, image : "Onna-Logo", text : "onna")
                _buildTitleAndDescription
                _buildNameTextField
                Spacer()
                _buildImage
            }
            .ignoresSafeArea()
            .padding(.top, 5)
        }
    }
    
    var _buildTitleAndDescription: some View {
        HStack {
            Rectangle()
                .fill(Color.onnaBackgroundBlack)
                .frame(width: 4, height: size.height * 0.2, alignment: .center)
                .padding(.top, size.height * -0.01)
            
            VStack (alignment: .leading) {
                _buildTitle
                _buildDescription
            }
        }
        .padding(.leading, size.height *  0.1)
    }
    
    var _buildTitle: some View {
        VStack (alignment: .leading) {
            Text("Então".uppercased())
                .onnaFont(.largeTitle)
                .foregroundColor(.onnaBackgroundBlack)
            Text("primeiramente".uppercased())
                .onnaFont(.title1)
                .foregroundColor(.onnaBackgroundBlack)
                .padding(.top, -10)
        }
        .padding(.top, size.height * 0.01)
    }
    
    var _buildDescription: some View {
        VStack {
            Text("Gostariamos de saber como gostaria que referiamos a você.")
                .onnaFont(.body)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: size.width * 0.6, height: size.height * 0.15, alignment: .leading)
        }
        .padding(.top, -10)
    }
    
    var _buildNameTextField: some View {
        TextFieldWithButtonView(fieldName: "Nome", action: {viewRouter.currentPage = .onBoarding03View}, textColor: .onnaBackgroundBlack)
            .padding(.horizontal, 20)
    }
    
    var _buildImage: some View {
        HStack {
            Image("Deh")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width, alignment: .leading)
        }
        .ignoresSafeArea()
    }
}

struct OnBoarding02View_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding02View()
    }
}
