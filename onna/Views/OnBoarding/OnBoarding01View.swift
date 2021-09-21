//
//  ContentView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 01/09/21.
//

import SwiftUI

struct OnBoarding01View: View {
    @AppStorage("login") private var login = false
    let userID = UserDefaults.standard.object(forKey: "userID") as? String
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaGreen.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                SquaresAndLogoView(actualSquare: 0, image : "Onna-Logo", text : "onna")
                _buildTitleAndDescription
                NextRoundedButtonView(fieldName: "", action: {viewRouter.currentPage = .onBoarding02View}, hasError: .constant(false))
                    .padding(.trailing, 15)
                Spacer()
                _buildImage
            }
            .ignoresSafeArea()
            .padding(.top, 5)
        }
    }
    
    var _buildTitleAndDescription: some View {
        VStack (alignment: .leading) {
            _buildTitle
            _buildDescription
        }
        .padding(.leading, 50)
    }
    
    var _buildTitle: some View {
        VStack {
            Text("OI,\nPRAZER")
                .onnaFont(.largeTitle)
                .foregroundColor(.onnaBackgroundBlack)
                .padding()
            Rectangle()
                .fill(Color.onnaBackgroundBlack)
                .frame(width: 165, height: 3, alignment: .center)
                .padding(.top, -20)
        }
        .padding(.top, 20)
    }
    
    var _buildDescription: some View {
        VStack {
            Text("Somos o grupo ONNA, aqui você terá uma jornada de descoberta como mulher, mostrando que você não está sozinha no mundo.")
                .onnaFont(.body)
                .foregroundColor(.onnaBackgroundBlack)
                .padding()
                .frame(width: 250, height: 140, alignment: .center)
        }
        .padding(.top, -35)
    }
    
    var _buildImage: some View {
        HStack {
            Image("Bru")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .ignoresSafeArea()
        .padding(.leading, 5)
    }
}

struct OnBoarding01View_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding01View()
    }
}
