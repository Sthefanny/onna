//
//  QuizSecondView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 15/09/21.
//

import SwiftUI

struct QuizSecondView: View {
    
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            ConteudoVoltarView(action: {}, conteudoName: "QUIZ")
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.onnaWhite)
                    .frame(width: 390, height: 730, alignment: .bottom)
                    .padding(.top, 100)
                
                VStack {
                    
                    Spacer()
                    
                    QuizQuestionView(conteudo: "Quiz", numero: "12.", description: "Qual das alternativas a seguir pode potencialmente atrasar sua menstruação? ")
                        .padding(EdgeInsets(top:32, leading: 0, bottom: 32, trailing: 0))
                    
//                    _buildFirstTypeQuiz
                    _buildSecondTypeQuiz
                    
                    Spacer()
                }
            }
        }
    }
    
    var _buildFirstTypeQuiz: some View {
        VStack {
            HStack {
                ElipseQuizView(action: {}, respostaNome: "Exercício Físico")
                ElipseQuizView(action: {}, respostaNome: "Estresse")
            }
            HStack {
                ElipseQuizView(action: {}, respostaNome: "Ganho de Peso")
                ElipseQuizView(action: {}, respostaNome: "Todas as anteriores")
            }
        }
    }
    
    var _buildSecondTypeQuiz: some View {
        HalfElipseQuizView(action: {}, respostaNome: "Verdadeiro", segundaRespostaNome: "Falso")
    }
}

struct QuizSecondView_Previews: PreviewProvider {
    static var previews: some View {
        QuizSecondView()
    }
}
