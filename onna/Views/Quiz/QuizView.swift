//
//  QuizFirstView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 15/09/21.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var viewModel = QuizViewModel()
    @State var quizId: Int
    
    init(_ quizId: Int) {
        self.quizId = quizId
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            ConteudoVoltarView(conteudoName: viewModel.quiz?.title ?? "")
                .padding(.bottom, 20)
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.onnaBlue)
                    .frame(width: 390, height: 730, alignment: .bottom)
                    .padding(.top, 100)
                
                Image(viewModel.quiz?.image ?? "")
                    .resizable()
                    .padding(.top, 140)
                
                VStack() {
                    Text(viewModel.quiz?.description ?? "")
                        .onnaFont(.title1)
                        .foregroundColor(Color.onnaBackgroundBlack)
                        .multilineTextAlignment(.center)
                        .frame(width: 200, height: 200, alignment: .center)
                    
                    
                    BlackButtonView(action: {
                        viewRouter.parameter = viewModel.quiz?.id
                        viewRouter.parameter2 = 1
                        viewRouter.parameter3 = viewModel.quiz?.quizQuestions.count
                        viewRouter.currentPage = .quizQuestionView
                    }, buttonText: "Próximo")
                    .offset(x: 110, y: 240)
                }
            }
        }
        .onAppear{
            viewModel.getQuiz(id: quizId) { hasItem in
                if (!hasItem){
                    DispatchQueue.main.async {
                        viewRouter.currentPage = .loginView
                    }
                }
            }
            
        }
    }
}

struct QuizFirstView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(1)
    }
}
