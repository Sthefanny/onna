//
//  QuizFirstView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 15/09/21.
//

import SwiftUI

struct QuizFirstView: View {
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            ConteudoVoltarView(action: {}, conteudoName: "QUIZ")
                .padding(.top, 19)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.onnaBlue)
                    .frame(width: 390, height: 730, alignment: .bottom)
                    .padding(.top, 100)
                
                Image("Quiz-Background")
                    .resizable()
                    .frame(width: 390, height: 730, alignment: .bottom)
                    .padding(.top, 140)
                
                VStack {
                
                    ChallengeTextView(challenge: "Quiz", title: "Menstruação", description: "Você consegue acertar todas as perguntas deste quiz sobre menstruação? Descubre o quanto você sabe sobre seu próprio corpo.", tip: "")
                        .padding(EdgeInsets(top: 200, leading: 0, bottom: 150, trailing: 0))
            
                    
                ChallengeButtonView(action: {}, buttonText: "Bora escrever!")
                    .padding(EdgeInsets(top: 150, leading: 200, bottom: 19, trailing: 20))
                }
            }
        }
    }
}

struct QuizFirstView_Previews: PreviewProvider {
    static var previews: some View {
        QuizFirstView()
    }
}
