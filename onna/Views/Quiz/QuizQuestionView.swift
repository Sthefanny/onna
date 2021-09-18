//
//  QuizSecondView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 15/09/21.
//

import SwiftUI

struct QuizQuestionView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var viewModel = QuizQuestionViewModel()
    @State var quizId: Int
    @State var actualIndex: Int
    @State var totalQuestions: Int
    
    init(_ quizId: Int, _ actualIndex: Int, _ totalQuestions: Int) {
        self.quizId = quizId
        self.actualIndex = actualIndex
        self.totalQuestions = totalQuestions
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            
            ConteudoVoltarView(conteudoName: "QUIZ")
                .padding(.top, -40)
            
            ZStack(alignment: .bottom) {
                
                Spacer()
                VStack {
                    
                    VStack (alignment: .leading) {
                        Text("\(actualIndex).")
                            .padding(.bottom, 1)
                            .onnaFont(.subheadline, textSize: 20)
                            .foregroundColor(.onnaBackgroundBlack)
                        
                        Text(viewModel.quizQuestion?.text ?? "")
                            .onnaFont(.subheadline, textSize: 20)
                            .foregroundColor(.onnaBackgroundBlack)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 50)
                    .frame(width: 392, height: 350, alignment: .topLeading)
                    .background(RoundedRectangle(cornerRadius: 20))
                    .foregroundColor(.onnaYellow)
                    
                    if (viewModel.quizQuestion?.quizAnswers.count == 4) {
                        ElipseQuizView(action: {showNext()}, quizAnswers: viewModel.quizQuestion!.quizAnswers)
                    } else if (viewModel.quizQuestion?.quizAnswers.count == 2) {
                        HalfElipseQuizView(action: {showNext()}, quizAnswers: viewModel.quizQuestion!.quizAnswers)
                            .padding(.top, 60)
                    }
                    
                    Spacer()
                }
                .edgesIgnoringSafeArea(.bottom)
                .background(RoundedRectangle(cornerRadius: 20))
                .foregroundColor(.onnaWhite)
                .padding(.bottom, -40)
            }
            .padding(.top, 50)
        }
        .onAppear {
            viewModel.getQuizQuestion(quizId: quizId, questionIndex: actualIndex) { hasItem in
                if (!hasItem){
                    DispatchQueue.main.async {
                        viewRouter.currentPage = .loginView
                    }
                }
            }
        }
    }
    
    func showNext() {
        viewRouter.currentPage = .loadingView
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let nextIndex = actualIndex + 1
            
            if (nextIndex > totalQuestions) {
                viewRouter.currentPage = .quizResultView
            } else {
                viewRouter.parameter = quizId
                viewRouter.parameter2 = nextIndex
                viewRouter.parameter3 = totalQuestions
                viewRouter.currentPage = .quizQuestionView
            }
        }
    }
}

struct QuizQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizQuestionView(1, 1, 9)
    }
}
