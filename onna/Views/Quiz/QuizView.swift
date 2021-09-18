//
//  QuizFirstView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 15/09/21.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var quiz: Quiz
    
    init(_ quiz: Quiz) {
        self.quiz = quiz
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            ConteudoVoltarView(conteudoName: quiz.title)
                .padding(.bottom, 20)
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.onnaBlue)
                    .frame(width: 390, height: 730, alignment: .bottom)
                    .padding(.top, 100)
                
                Image(quiz.image)
                    .resizable()
                    .padding(.top, 140)
                
                VStack() {
                    Text(quiz.description)
                        .onnaFont(.title1)
                        .foregroundColor(Color.onnaBackgroundBlack)
                        .multilineTextAlignment(.center)
                        .frame(width: 200, height: 200, alignment: .center)
                    
                    
                    BlackButtonView(action: {
                        viewRouter.parameter = quiz.id
                        viewRouter.parameter2 = 1
                        viewRouter.currentPage = .quizQuestionView
                    }, buttonText: "Próximo")
                        .offset(x: 110, y: 240)
                }
            }
        }
    }
}

struct QuizFirstView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(Quiz(id: 1, journeyId: 1, icon: "", title: "Menstruação", description: "Você consegue acertar todas as perguntas deste quiz sobre menstruação?", image: "Quiz-Background", imageType: "full", positiveResult: "", negativeResult: "", quizQuestions: [QuizQuestion(id: 0, quizId: 1, index: 1, text: "Qual das alternativas a seguir pode potencialmente atrasar sua menstruação?", quizAnswers: [
            QuizAnswer(id: 0, quizQuestionId: 1, text: "Verdadeiro", isCorrect: false),
            QuizAnswer(id: 1, quizQuestionId: 1, text: "Falso", isCorrect: true)
        ])]))
    }
}
