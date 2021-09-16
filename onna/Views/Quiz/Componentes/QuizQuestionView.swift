//
//  QuizQuestionView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 15/09/21.
//

import SwiftUI

struct QuizQuestionView: View {
    
    let conteudo: String
    let numero: String
    let description: String
    
    var body: some View {
        VStack (alignment: .leading){
            
            HStack (alignment: .center, spacing: 8){
                //Challenge Superior
                Image("StarPreto")
                    .scaledToFit()
                    .frame(width: 13, height: 12, alignment: .center)
                
                //Challenge
                Text(conteudo)
                    .onnaFont(.callout)
                    .foregroundColor(.onnaBackgroundBlack)
                
                Image("StarPreto")
                    .scaledToFit()
                    .frame(width: 13, height: 12, alignment: .center)
                
            }
            .padding(.init(top: 0, leading: 20, bottom: 8, trailing: 0))
            
            HStack (alignment: .firstTextBaseline) {
                //Title
                Text(numero)
                    .onnaFont(.largeTitle)
                    .foregroundColor(.onnaBackgroundBlack).multilineTextAlignment(.leading)
                    .frame(width: 45, height: 20, alignment: .topLeading)
                    .padding(.init(top: 8, leading: 20, bottom: 19, trailing: 0))
                
                //description
                Text(description)
                    .onnaFont(.subheadline)
                    .foregroundColor(.onnaBackgroundBlack)
                    .frame(width: 250, height: 100, alignment: .topLeading)
                    .padding(.init(top: 0, leading: 0, bottom: 8, trailing: 20))
                
            }
        }
    }
}

struct QuizQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizQuestionView(conteudo: "Quiz", numero: "12.", description: "Qual das alternativas a seguir pode potencialmente atrasar sua menstruação? ")
    }
}
