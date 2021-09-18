//
//  QuizSecondView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 15/09/21.
//

import SwiftUI

struct QuizQuestionView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var quizId: Int
    @State var actualIndex: Int
    @ObservedObject var viewModel = QuizQuestionViewModel()
    
    init(_ quizId: Int, _ actualIndex: Int) {
        self.quizId = quizId
        self.actualIndex = actualIndex
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
                        ElipseQuizView(action: {
                            let nextIndex = actualIndex + 1
                            viewRouter.parameter = quizId
                            viewRouter.parameter2 = nextIndex
                            viewRouter.currentPage = .quizQuestionView
                        }, quizAnswers: viewModel.quizQuestion!.quizAnswers)
                    } else {
                        HalfElipseQuizView(action: {
                            let nextIndex = actualIndex + 1
                            viewRouter.parameter = quizId
                            viewRouter.parameter2 = nextIndex
                            viewRouter.currentPage = .quizQuestionView
                        }, quizAnswers: viewModel.quizQuestion!.quizAnswers)
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
}

struct QuizQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizQuestionView(1, 1)
    }
}
