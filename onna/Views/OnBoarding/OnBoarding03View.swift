//
//  OnBoarding03View.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct OnBoarding03View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var userName: String = "Stel" //ToDo: Remover default
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaBlue.edgesIgnoringSafeArea(.all)
            
            ZStack {
                VStack(alignment: .leading) {
                    SquaresAndLogoView(actualSquare: 2)
                    _buildTitleAndDescription
                    Spacer()
                    _buildImage
                }
                .ignoresSafeArea()
                .padding(.top, 5)
                
                NextRoundedButtonView(fieldName: "", action: {viewRouter.currentPage = .onBoarding04View}, hasError: .constant(false)).padding(.trailing, 15)
            }
        }
        .onAppear() {
            if let data = UserDefaults.standard.string(forKey: UserDefaultsKeys.nickName.name) {
                userName = data
            }
        }
    }
    
    var _buildTitleAndDescription: some View {
        HStack {
            Spacer()
            VStack (alignment: .center) {
                _buildTitle
                _buildDescription
            }
            Spacer()
        }
    }
    
    var _buildTitle: some View {
        VStack {
            Text("Sendo assim,")
                .onnaFont(.body, textSize: 18)
                .foregroundColor(.onnaBackgroundBlack)
            Text("Welcome\n\(userName)".uppercased())
                .onnaFont(.title1, textSize: 24)
                .foregroundColor(.onnaBackgroundBlack)
                .multilineTextAlignment(.center)
            Rectangle()
                .fill(Color.onnaBackgroundBlack)
                .frame(width: 284, height: 5, alignment: .center)
        }
        .padding(.vertical, 20)
    }
    
    var _buildDescription: some View {
        VStack(alignment: .center) {
            Text("Preparamos conteúdos feitos pra você passar o tempo e aprender mais sobre seus sentimentos e corpo.")
                .onnaFont(.body, textSize: 18)
                .multilineTextAlignment(.center)
                .foregroundColor(.onnaBackgroundBlack)
        }
        .padding(.horizontal, 40)
    }
    
    var _buildImage: some View {
        HStack {
            Image("Dani")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .ignoresSafeArea()
    }
}

struct OnBoarding03View_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding03View()
    }
}
