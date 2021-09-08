//
//  OnBoarding05View.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct OnBoarding05View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaGreen.edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    SquaresAndLogoView(actualSquare: 4)
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
            .padding(.horizontal, 80)
            .padding(.bottom, 40)
    }
    
    var _buildImage: some View {
        ZStack {
            Image("Sthe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
            
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
