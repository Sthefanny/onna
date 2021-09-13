//
//  TextPadrao.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 10/09/21.
//

import SwiftUI

struct TextPadrao: View {
    var body: some View {
        VStack (alignment: .leading){
            
            HStack (alignment: .center, spacing: 8){
                Image("StarPreto")
                    .scaledToFit()
                    .frame(width: 13, height: 12, alignment: .center)
                
                //Challenge
                Text("Challenge")
                    .onnaFont(.callout)
                    .foregroundColor(.onnaBackgroundBlack)
                
                Image("StarPreto")
                    .scaledToFit()
                    .frame(width: 13, height: 12, alignment: .center)

            }
            .padding(.leading, 20)
            
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
                .padding(.leading, 20)
            
        }
    }
}

struct TextPadrao_Previews: PreviewProvider {
    static var previews: some View {
        TextPadrao()
    }
}
