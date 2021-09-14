//
//  ChallengeView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 09/09/21.
//

import SwiftUI

//struct Challenges: Decodable {
//    let id: Int
//    let journeyId: Int
//    let title: String
//    let description: String
//    let tip: String
//}

struct ChallengeView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            ConteudoVoltarView(action: {})
            
            if viewRouter.previousPage == .homeView {
                ConteudoVoltarView(action: {viewRouter.currentPage = .homeView})
            } else {
                ConteudoVoltarView(action: {viewRouter.currentPage = .timelineView})
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.onnaWhite)
                    .frame(width: 390, height: 730, alignment: .bottom)
                    .padding(.top, 100)
                
                VStack (alignment: .center){
                    Image("Illustration-1")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                    
                    ChallengeTextView(challenge: "Challenge", title: "Amor Próprio", description: "Envie uma mensagem de amor para você mesma no futuro. Pode ser alguma coisa que você admira em si, um objetivo que conseguiu cumprir ou um motivacional.", tip: "Pense com carinho :)")
                    
                    ChallengeButtonView(action: {viewRouter.currentPage = .challengeSendTextView}, buttonText: "Bora escrever!")
                    
                }
            }
        }
    }
}


struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
