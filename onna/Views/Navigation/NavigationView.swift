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
        case .onBoarding03View:
            OnBoarding03View()
        case .onBoarding04View:
            OnBoarding04View()
        case .onBoarding05View:
            OnBoarding05View()
        case .contentFeminismView:
            ContentFeminismView()
        case .contentBodyPositiveView:
            ContentBodyPositiveView()
        case .loginView:
            LoginView()
        case .homeView:
            switch viewRouter.previousPage {
            case .profileView:
                HomeView()
                    .transition(.move(edge: .leading))
            case .timelineView:
                HomeView()
                    .transition(.move(edge: .trailing))
            default:
                HomeView()
            }
        case .profileView:
            ProfileView()
                .transition(.move(edge: .trailing))
        case .timelineView:
            TimelineView()
                .transition(.move(edge: .leading))
        case .story01_2View:
            Story01_2View()
        case .story01_3View:
            Story01_3View()
        case .story01View:
            Story01View()
        case .challengeView:
            ChallengeView(viewRouter.parameter as! Challenge)
        case .quizView:
            QuizView(viewRouter.parameter as! Int)
        case .quizQuestionView:
            QuizQuestionView(viewRouter.parameter as! Int, viewRouter.parameter2 as! Int, viewRouter.parameter3 as! Int)
        case .loadingView:
            LoadingView()
        case .quizResultView:
            QuizResultView()
        case .chatView:
            ChatView(viewRouter.parameter as! Int)
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView().environmentObject(ViewRouter())
    }
}
