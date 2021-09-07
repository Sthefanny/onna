//
//  LoginView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Image("Onboarding-Background-Gradient")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                _buildTitle
                Spacer()
                _buildAppleButton
                _buildTerms
            }
        }
    }
    
    var _buildTitle: some View {
        Image("Onna-Logo-Type")
            .resizable()
            .frame(width: 227, height: 81, alignment: .center)
            .aspectRatio(contentMode: .fit)
            .padding(.top, -150)
    }
    
    var _buildAppleButton: some View {
        AppleLoginButtonView(login: true)
    }
    
    var _buildTerms: some View {
        VStack (alignment: .center) {
            Text("By continuing, you confirm your agreement to our ")
                + Text("Terms and Conditions ").underline()
                + Text("and our ")
                + Text("Privacy Policy").underline()
        }
        .onnaFont(.callout, textSize: 12)
        .foregroundColor(.onnaWhite)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 50)
        .padding(.bottom, 80)
        .padding(.top, 10)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
