//
//  ChallengeSendTextView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 13/09/21.
//

import SwiftUI

struct ChallengeView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var challengeId: Int
    @ObservedObject var challengeWiewModel = ChallengeViewModel()
    @ObservedObject var viewModel = DynamicResultViewModel()
    var dynamicResult: DynamicResult
    
    init(_ challengeId: Int, _ dynamicResult: DynamicResult) {
        self.challengeId = challengeId
        self.dynamicResult = dynamicResult
    }
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            ConteudoVoltarView(conteudoName: "Challenge", dynamicResult: dynamicResult, saveResult: false)
            
            if (challengeWiewModel.challenge == nil) {
                LoadingView()
            } else {
                ZStack () {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.onnaGreyContent)
                        .frame(width: 390, height: 730, alignment: .bottom)
                        .padding(.top, 100)
                    
                    VStack {
                        Spacer()
                        
                        Image(challengeWiewModel.challenge!.image!)
                            .resizable()
                            .frame(maxWidth: 200, maxHeight: 200)
                        
                        ChallengeTextView(challenge: challengeWiewModel.challenge!)
                        
                        TextFieldView(placeholder: "Fale com o seu eu do futuro...", message: "", callback: {_ in
                            viewModel.addResult(result: dynamicResult, callback: {_ in})
                            self.hideKeyboard()
                            viewRouter.currentPage = viewRouter.previousPage
                        })
                    }
                }
            }
        }
        .onAppear {
            challengeWiewModel.getChallengeById(challengeId: challengeId) { _ in }
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
    
//    struct ChallengeSendTextView_Previews: PreviewProvider {
//        static var previews: some View {
//            let challenge = Challenge(id: 0, journeyId: 0, icon: "", image: "", title: "Amor Próprio", description: "Envie uma mensagem de amor para você mesma no futuro. Pode ser alguma coisa que você admira em si, um objetivo que conseguiu cumprir ou um motivacional.", tip: "Pense com carinho :)")
//            ChallengeView(challenge, DynamicResult(id: nil, journeyId: 1, entityId: 1, entityName: ""))
//        }
//    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
