//
//  ElipseQuizView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 15/09/21.
//

import SwiftUI

struct ElipseQuizView: View {
    @State var action: () -> Void
    @State var quizAnswers: [QuizAnswer]
    @State var leftColor: Color? = Color.onnaWhite
    @State var rightColor: Color? = Color.onnaWhite
    
    var body: some View {
        VStack() {
            HStack {
                _buildEllipseAnswer(answer: quizAnswers[0])
                _buildEllipseAnswer(answer: quizAnswers[1])
            }
            HStack {
                _buildEllipseAnswer(answer: quizAnswers[2])
                _buildEllipseAnswer(answer: quizAnswers[3])
            }
        }
        .padding()
    }
    
    func _buildEllipseAnswer(answer: QuizAnswer) -> some View {
        var color = Color.onnaWhite
        return HStack {
            ZStack {
                Button(action: {
                    color = answer.isCorrect ? Color.green : Color.red
                    self.action()
                }) {
                    Image("ElipseQuiz")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
                Text(answer.text)
                    .onnaFont(.body)
                    .foregroundColor(color)
                    .multilineTextAlignment(.center)
                    .frame(width: 110, height: 120, alignment: .center)
            }
        }
        .padding(8)
    }
}
    
struct ElipseQuizView_Previews: PreviewProvider {
    static var previews: some View {
        ElipseQuizView(action: {}, quizAnswers: [
            QuizAnswer(id: 0, quizQuestionId: 1, text: "Exercicio Físico", isCorrect: false),
            QuizAnswer(id: 1, quizQuestionId: 1, text: "Estresse", isCorrect: true),
            QuizAnswer(id: 2, quizQuestionId: 1, text: "Ganho de Peso", isCorrect: false),
            QuizAnswer(id: 3, quizQuestionId: 1, text: "Todas anteriores", isCorrect: false)
        ])
    }
}
