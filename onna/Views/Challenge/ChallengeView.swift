//
//  ChallengeSendTextView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 13/09/21.
//

import SwiftUI

struct ChallengeView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var challenge: Challenge
    @ObservedObject var viewModel = DynamicResultViewModel()
    var dynamicResult: DynamicResult
    
    init(_ challenge: Challenge, _ dynamicResult: DynamicResult) {
        self.challenge = challenge
        self.dynamicResult = dynamicResult
    }
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            ConteudoVoltarView(conteudoName: "BLOG")
            
            ZStack () {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.onnaGreyContent)
                    .frame(width: 390, height: 730, alignment: .bottom)
                    .padding(.top, 100)
                
                VStack {
                    Spacer()
                    
                    Image(challenge.image!)
                        .resizable()
                        .frame(maxWidth: 200, maxHeight: 200)
                    
                    ChallengeTextView(challenge: challenge)
                    
                    TextFieldView(placeholder: "Fale com o seu eu do futuro...", message: "", callback: {_ in
                        viewModel.addResult(result: dynamicResult, callback: {_ in})
                    })
                }
                
            }
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
    
    struct ChallengeSendTextView_Previews: PreviewProvider {
        static var previews: some View {
            let challenge = Challenge(id: 0, journeyId: 0, icon: "", image: "", title: "Amor Próprio", description: "Envie uma mensagem de amor para você mesma no futuro. Pode ser alguma coisa que você admira em si, um objetivo que conseguiu cumprir ou um motivacional.", tip: "Pense com carinho :)")
            ChallengeView(challenge, DynamicResult(id: nil, journeyId: 1, entityId: 1, entityName: ""))
        }
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
