//
//  NavigationView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct NavigationView: View {
    @EnvironmentObject var viewRouter: ViewRouter
        
        var body: some View {
            switch viewRouter.currentPage {
            case .onBoarding01View:
                OnBoarding01View()
            case .onBoarding02View:
                OnBoarding02View()
                    .transition(.scale)
            case .onBoarding03View:
                OnBoarding03View()
            case .onBoarding04View:
                OnBoarding04View()
            case .onBoarding05View:
                OnBoarding05View()
            case .loginView:
                LoginView()
            case .homeView:
                HomeView()
            }
        }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView().environmentObject(ViewRouter())
    }
}
