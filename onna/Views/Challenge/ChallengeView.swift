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
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.onnaWhite)
                    .frame(width: 390, height: 730, alignment: .bottom)
                    .padding(.top, 100)
                
                VStack (alignment: .center){
                Image("Illustration-5")
                    .resizable()
                    .frame(width: 180, height: 250)
                    .padding(.top, 19)
                    
                    VStack (alignment: .leading){
                        
                    //Challenge
                    Text("Challenge")
                        .onnaFont(.callout)
                        .foregroundColor(.onnaBackgroundBlack)
                        .multilineTextAlignment(.leading)
                        .padding(.init(top: 10, leading: 20, bottom: 8, trailing: 0))
                    
                    //Title
                    Text("Amor Próprio")
                        .onnaFont(.largeTitle)
                        .foregroundColor(.onnaBackgroundBlack).multilineTextAlignment(.leading)
                        .padding(.init(top: 0, leading: 20, bottom: 19, trailing: 0))
                        
                        //description
                        Text("Envie uma mensagem de amor para você mesma no futuro. Pode ser alguma coisa que você admira em si, um objetivo que conseguiu cumprir ou um motivacional.")
                            .onnaFont(.body)
                            .foregroundColor(.onnaBackgroundBlack)
                            .padding(.init(top: 0, leading: 20, bottom: 8, trailing: 20))
                        
                        //Tip
                        Text("Pense com carinho :)")
                            .onnaFont(.body)
                            .foregroundColor(.onnaBlue)
                            .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 0))
                    }
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
