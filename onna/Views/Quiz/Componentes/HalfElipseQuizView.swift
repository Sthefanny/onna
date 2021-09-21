//
//  HalfElipseQuizView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 15/09/21.
//

import SwiftUI

struct HalfElipseQuizView: View {
    
    @State var action: () -> Void
    @State var quizAnswers: [QuizAnswer]
    @State var showCorrect = false
    @State var quizId: Int
    @State var totalQuestions: Int
    
    var body: some View {
        HStack {
            
            ForEach(0 ..< quizAnswers.count) { i in
                if i % 2 == 0 {
                    ZStack {
                        Button(action: {
                            saveAnswer(i: i)
                            showCorrect = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                self.action()
                            }
                        }) {
                            Image("Quiz-Half")
                                .resizable()
                                .frame(width: 180, height: 180)
                        }
                        Text(quizAnswers[i].text)
                            .onnaFont(.body)
                            .foregroundColor(showCorrect ? quizAnswers[i].isCorrect ? Color.green : Color.red : .onnaWhite)
                            .frame(width: 130, height: 100, alignment: .center)
                            .rotationEffect(Angle(degrees: -45))
                            .transformEffect(CGAffineTransform(translationX: -20, y: -20))
                    }
                    .transformEffect(CGAffineTransform(translationX: 40, y: 0))
                } else {
                    ZStack {
                        Button(action: {
                            saveAnswer(i: i)
                            showCorrect = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                self.action()
                            }
                        }) {
                            Image("Quiz-Half-2")
                                .resizable()
                                .frame(width: 180, height: 180)
                        }
                        Text(quizAnswers[i].text)
                            .onnaFont(.body)
                            .foregroundColor(showCorrect ? quizAnswers[i].isCorrect ? Color.green : Color.red : .onnaWhite)
                            .frame(width: 130, height: 100, alignment: .center)
                            .rotationEffect(Angle(degrees: -48))
                            .transformEffect(CGAffineTransform(translationX: 20, y: 20))
                    }
                    .transformEffect(CGAffineTransform(translationX: -40, y: 0))
                }
            }
        }
        .padding(8)
    }
    
    func saveAnswer(i: Int) {
        if (quizAnswers[i].isCorrect) {
            QuizHelper.saveQuizAnswers(quizId: quizId, totalQuestions: totalQuestions)
        }
    }
}

struct HalfElipseQuizView_Previews: PreviewProvider {
    static var previews: some View {
        HalfElipseQuizView(action: {}, quizAnswers: [
            QuizAnswer(id: 0, quizQuestionId: 1, text: "Verdadeiro", isCorrect: false),
            QuizAnswer(id: 1, quizQuestionId: 1, text: "Falso", isCorrect: true)
        ], quizId: 1, totalQuestions: 2)
    }
}
