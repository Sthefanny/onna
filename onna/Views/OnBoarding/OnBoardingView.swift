//
//  ContentView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 01/09/21.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaGreen.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                _buildProgressionSquares
                _buildLogoAndName
                _buildTitle
                _buildDescription
                _buildImage
            }
        }
    }
    
    var _buildLogoAndName: some View {
        HStack(alignment: .center) {
            Circle()
                .frame(width: 50, height: 50, alignment: .center)
            Text("Onna")
                .onnaFont(.title2)
                .foregroundColor(.onnaWhite)
        }
        .padding(.top, -10)
        .padding(.leading, 20)
    }
    
    var _buildProgressionSquares: some View {
        HStack(alignment: .center, spacing: 15) {
            Spacer()
            _buildProgressionSquare(isActual: true)
            _buildProgressionSquare(isActual: false)
            _buildProgressionSquare(isActual: false)
            _buildProgressionSquare(isActual: false)
            _buildProgressionSquare(isActual: false)
            Spacer()
        }
        .padding(.top, 10)
    }
    
    func _buildProgressionSquare(isActual: Bool) -> some View {
        HStack {
            Rectangle()
                .fill(isActual ? Color.onnaBackgroundBlack : .clear)
                .border(Color.onnaBackgroundBlack, width: 1)
                .frame(width: 52, height: 6, alignment: .center)
                .padding(.top, -20)
        }
        .padding(.top, 10)
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
        .padding(.leading, 50)
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
        .padding(.leading, 50)
    }
    
    var _buildImage: some View {
        VStack(alignment: .trailing) {
            Spacer()
            Image("Bru")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: .infinity, height: .infinity, alignment: .bottomTrailing)
        .ignoresSafeArea()
        .padding(.bottom, 0)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .previewDevice("iPhone 12")
    }
}
