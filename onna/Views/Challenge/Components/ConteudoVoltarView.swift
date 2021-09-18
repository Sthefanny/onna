//
//  ConteudoVoltarView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 10/09/21.
//

import SwiftUI

struct ConteudoVoltarView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var didTap : Bool = false
    let conteudoName: String
    
    var body: some View {
        HStack (alignment: .center, spacing: 10) {
            
            Button(action: {
                viewRouter.currentPage = viewRouter.previousPage
            }, label: {
                Label("Voltar", systemImage: "chevron.backward")
                    .onnaFont(.body)
                    .foregroundColor(.onnaWhite)
                    .padding(EdgeInsets(top:0, leading: 14, bottom: 0, trailing: 0))
            })
            
            Spacer()
            
            Text(conteudoName)
                .onnaFont(.body)
                .foregroundColor(.onnaWhite)
            
            Spacer()
            
            Button(action: {
                self.didTap.toggle()
            }) {
                Image(systemName: self.didTap == false ? "heart" : "heart.fill")
                    .imageScale(.large)
                    .foregroundColor(Color.onnaPink)
            }
            .padding()
        }
        .padding(.top, 35)
    }
}

struct ConteudoVoltarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            ConteudoVoltarView(conteudoName: "Feminismo")
        }
    }
}
