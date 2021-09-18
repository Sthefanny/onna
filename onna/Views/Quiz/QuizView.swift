//
//  QuizFirstView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 15/09/21.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            ConteudoVoltarView(conteudoName: "QUIZ")
                .padding(.bottom, 20)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.onnaBlue)
                    .frame(width: 390, height: 730, alignment: .bottom)
                    .padding(.top, 100)
                
                Image("Quiz-Background")
                    .resizable()
                    .padding(.top, 140)
                
                VStack() {
                    Text("Você consegue acertar todas as perguntas deste quiz sobre menstruação?")
                        .onnaFont(.title1)
                        .foregroundColor(Color.onnaBackgroundBlack)
                        .multilineTextAlignment(.center)
                        .frame(width: 200, height: 200, alignment: .center)
                    
                    
                    BlackButtonView(action: {}, buttonText: "Próximo")
                        .offset(x: 110, y: 240)
                }
            }
        }
    }
}

struct QuizFirstView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
