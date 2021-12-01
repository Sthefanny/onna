//
//  OnBoarding04View.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct OnBoarding04View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    let size = UIScreen.main.bounds
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaYellow.edgesIgnoringSafeArea(.all)
            
            ZStack {
                VStack(alignment: .leading) {
                    SquaresAndLogoView(actualSquare: 3, image : "Onna-Logo", text : "onna")
                    _buildImage
                    _buildTitleAndDescription
                }
                .ignoresSafeArea()
                .padding(.top, 5)
                
                NextRoundedButtonView(fieldName: "", action: {viewRouter.currentPage = .onBoarding05View}, hasError: .constant(false))
                    .padding(.trailing, 15).padding(.top, 50)
            }
        }
    }
    
    var _buildTitleAndDescription: some View {
        VStack {
            Text("Rede".uppercased())
                .onnaFont(.largeTitle, textSize: 36)
                .foregroundColor(.onnaBackgroundBlack)
            Text("Com uma seção de rede de apoio de mulheres do mundo todo, você pode tirar suas dúvidas,  interagindo, conversar ou só visualizar.")
                .onnaFont(.body, textSize: 18)
                .multilineTextAlignment(.center)
                .foregroundColor(.onnaBackgroundBlack)
                .padding(.horizontal, 80)
        }
        .padding(.bottom, size.height * 0.05)
    }
    
    var _buildImage: some View {
        HStack {
            Image("Jess")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width, alignment: .center)
        }
        .ignoresSafeArea()
    }
}

struct OnBoarding04View_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding04View()
    }
}
