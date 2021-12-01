//
//  OnBoarding05View.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct OnBoarding05View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    let size = UIScreen.main.bounds
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaGreen.edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    SquaresAndLogoView(actualSquare: 4, image : "Onna-Logo", text : "onna")
                    _buildTitle
                    Spacer()
                    _buildImage
                }
                .ignoresSafeArea()
                .padding(.top, 5)
                
                _buildDescription
            }
        }
    }
    
    var _buildTitle: some View {
        HStack {
            Spacer()
            VStack () {
                Text("Compartilhe".uppercased())
                    .onnaFont(.largeTitle, textSize: 36)
                    .foregroundColor(.onnaBackgroundBlack)
                    .padding(.bottom, 0)
                Rectangle()
                    .fill(Color.onnaBackgroundBlack)
                    .frame(width: 284, height: 5, alignment: .center)
                    .padding(.top, -10)
            }
            Spacer()
        }
    }
    
    var _buildDescription: some View {
        Text("E para ficar ainda melhor, no final você pode compartilhar a sua conquistas com todo mundo nas redes sociais.")
            .onnaFont(.body, textSize: 18)
            .multilineTextAlignment(.center)
            .foregroundColor(.onnaBackgroundBlack)
            .frame(width: size.width * 0.8, height: size.height * 0.15, alignment: .center)
            .padding(.bottom, size.height * 0.05)
    }
    
    var _buildImage: some View {
        ZStack {
            Image("Sthe")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height * 0.5, alignment: .center)
                .ignoresSafeArea()
                .padding(.top, size.height * 0.2)
            
            NextRoundedButtonView(fieldName: "", action: {viewRouter.currentPage = .loginView}, hasError: .constant(false))
                .padding(.trailing, 15).padding(.top, -100)
        }
    }
}

struct OnBoarding05View_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding05View()
    }
}
