//
//  OnBoarding02View.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct OnBoarding02View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaPink.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                SquaresAndLogoView(actualSquare: 1)
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
                .frame(width: 4, height: 137, alignment: .center)
                .padding(.top, -20)
            
            VStack (alignment: .leading) {
                _buildTitle
                _buildDescription
            }
        }
        .padding(.leading, 70)
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
        .padding(.top, 20)
    }
    
    var _buildDescription: some View {
        VStack {
            Text("Gostariamos de saber como gostaria que referiamos a você.")
                .onnaFont(.body)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 220, height: 140, alignment: .leading)
        }
        .padding(.top, -35)
    }
    
    var _buildNameTextField: some View {
        TextFieldWithButtonView(fieldName: "Nome", action: {viewRouter.currentPage = .onBoarding03View})
            .padding(.horizontal, 20)
    }
    
    var _buildImage: some View {
        HStack {
            Image("Deh")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .ignoresSafeArea()
    }
}

struct OnBoarding02View_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding02View()
    }
}
