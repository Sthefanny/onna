//
//  SplashScreenView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 20/09/21.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            Image("splash-bg")
                .resizable()
                .ignoresSafeArea()
            Image("splash-logo")
        }
        .onAppear() {
            // Início - Limpar tudo
            //            let domain = Bundle.main.bundleIdentifier!
            //            UserDefaults.standard.removePersistentDomain(forName: domain)
            //            UserDefaults.standard.synchronize()
            //            print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
            // Fim - Limpar tudo
            
            //ToDo: Tirar prints
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                let userId = UserDefaults.standard.string(forKey: UserDefaultsKeys.userId.name)!
//                print("senha = \(userId)")
                
                let isLogged = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)
//                print("token = \(String(describing: isLogged))")
                if isLogged != nil {
                    viewRouter.currentPage = .homeView
                } else {
                    viewRouter.previousPage = .onBoarding01View
                    viewRouter.currentPage = .onBoarding01View
                }
            }
            
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
