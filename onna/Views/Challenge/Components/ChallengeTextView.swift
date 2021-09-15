//
//  ChallengeTextView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 10/09/21.
//

import SwiftUI

struct ChallengeTextView: View {
    
    let challenge: String
    let title: String
    let description: String
    let tip: String
    
    var body: some View {
        VStack (alignment: .leading){
            
            HStack (alignment: .center, spacing: 8){
                //Challenge Superior
                Image("StarPreto")
                    .scaledToFit()
                    .frame(width: 13, height: 12, alignment: .center)
                
                //Challenge
                Text(challenge)
                    .onnaFont(.callout)
                    .foregroundColor(.onnaBackgroundBlack)
                
                Image("StarPreto")
                    .scaledToFit()
                    .frame(width: 13, height: 12, alignment: .center)

            }
            .padding(.leading, 20)
            
            //Title
            Text(title)
                .onnaFont(.largeTitle)
                .foregroundColor(.onnaBackgroundBlack).multilineTextAlignment(.leading)
                .padding(.init(top: 8, leading: 20, bottom: 19, trailing: 0))
            
            //description
            Text(description)
                .onnaFont(.body)
                .foregroundColor(.onnaBackgroundBlack)
                .padding(.init(top: 0, leading: 20, bottom: 8, trailing: 20))
            
            //Tip
            Text(tip)
                .onnaFont(.subheadline)
                .foregroundColor(.onnaBlue)
                .padding(.leading, 20)
            
        }
    }
}

struct ChallengeTextView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeTextView(challenge: "Challenge", title: "Amor Próprio", description: "Envie uma mensagem de amor para você mesma no futuro. Pode ser alguma coisa que você admira em si, um objetivo que conseguiu cumprir ou um motivacional.", tip: "Pense com carinho :)")
    }
}
