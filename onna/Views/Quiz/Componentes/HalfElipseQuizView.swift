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
    @State var leftColor: Color? = Color.onnaWhite
    @State var rightColor: Color? = Color.onnaWhite
    
    var body: some View {
        HStack {
            
            ForEach(0 ..< quizAnswers.count) { i in
                if i % 2 == 0 {
                    ZStack {
                        Button(action: {
                            leftColor = quizAnswers[i].isCorrect ? Color.green : Color.red
                            self.action()
                        }) {
                            Image("Quiz-Half")
                                .resizable()
                                .frame(width: 180, height: 180)
                        }
                        Text(quizAnswers[i].text)
                            .onnaFont(.body)
                            .foregroundColor(leftColor)
                            .frame(width: 130, height: 100, alignment: .center)
                            .rotationEffect(Angle(degrees: -45))
                            .transformEffect(CGAffineTransform(translationX: -20, y: -20))
                    }
                    .transformEffect(CGAffineTransform(translationX: 40, y: 0))
                } else {
                    ZStack {
                        Button(action: {
                            rightColor = quizAnswers[i].isCorrect ? Color.green : Color.red
                            self.action()
                        }) {
                            Image("Quiz-Half-2")
                                .resizable()
                                .frame(width: 180, height: 180)
                        }
                        Text(quizAnswers[i].text)
                            .onnaFont(.body)
                            .foregroundColor(rightColor)
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
}

struct HalfElipseQuizView_Previews: PreviewProvider {
    static var previews: some View {
        HalfElipseQuizView(action: {}, quizAnswers: [
            QuizAnswer(id: 0, quizQuestionId: 1, text: "Verdadeiro", isCorrect: false),
            QuizAnswer(id: 1, quizQuestionId: 1, text: "Falso", isCorrect: true)
        ])
    }
}
