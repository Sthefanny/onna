//
//  ConteudoVoltarView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 10/09/21.
//

import SwiftUI

struct ConteudoVoltarView: View {
    
    @State var action: () -> Void
    
    var body: some View {
        HStack (alignment: .center, spacing: 100) {
            

            
            Button(action: {
                self.action()
            }, label: {
                Label("Voltar", systemImage: "chevron.backward")
                    .onnaFont(.body)
                    .foregroundColor(.onnaWhite)
                    .frame(width: 75)
                    .padding(.top, 35)
            })
            
            //criar uma variavel informando pra qual página quero voltar (passar a função)

            Text("BLOG")
                .onnaFont(.body)
                .foregroundColor(.onnaWhite)
                .padding(.top, 35)
            
            Image("Icon-Star-White")
                .resizable()
                .frame(width: 24, height: 32)
                .padding(.top, 35)
            
        }
        .padding()
    }
}

struct ConteudoVoltarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            ConteudoVoltarView(action: {})
        }
    }
}
