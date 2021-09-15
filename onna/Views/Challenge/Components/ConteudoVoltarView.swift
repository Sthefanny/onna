//
//  ConteudoVoltarView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 10/09/21.
//

import SwiftUI

struct ConteudoVoltarView: View {
    
    @State var action: () -> Void
    @State var didTap : Bool = false
    
    var body: some View {
        HStack (alignment: .center, spacing: 100) {
            
            Button(action: {
                self.action()
            }, label: {
                Label("Voltar", systemImage: "chevron.backward")
                    .onnaFont(.body)
                    .foregroundColor(.onnaWhite)
                    .frame(width: 75)
                    .padding(EdgeInsets(top:35, leading: 14, bottom: 0, trailing: 0))
            })
            
            //criar uma variavel informando pra qual página quero voltar (passar a função)
            
            Text("BLOG")
                .onnaFont(.body)
                .foregroundColor(.onnaWhite)
                .padding(.top, 35)
            
            Button(action: {
                self.didTap.toggle()
            }) {
                Image(systemName: self.didTap == false ? "heart" : "heart.fill")
                    .imageScale(.large)
                    .padding(.top, 35)
                    .foregroundColor(Color.onnaPink)
            }
            .padding()
        }
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
