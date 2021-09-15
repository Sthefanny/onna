//
//  ChallengeSendTextView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 13/09/21.
//

import SwiftUI

struct ChallengeSendTextView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            ConteudoVoltarView(action: {})
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.onnaWhite)
                    .frame(width: 390, height: 730, alignment: .bottom)
                    .padding(.top, 100)
                
                VStack {
                    Spacer()
                    
                    Image("Illustration-1")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                    
                    ChallengeTextView(challenge: "Challenge", title: "Amor Próprio", description: "Envie uma mensagem de amor para você mesma no futuro. Pode ser alguma coisa que você admira em si, um objetivo que conseguiu cumprir ou um motivacional.", tip: "Pense com carinho :)")
                
                    TextFieldView(placeholder: "Fale com o seu eu do futuro...", message: "", action: {})
                }
                
            }
        }
    }
    
    struct ChallengeSendTextView_Previews: PreviewProvider {
        static var previews: some View {
            ChallengeSendTextView()
        }
    }
}
