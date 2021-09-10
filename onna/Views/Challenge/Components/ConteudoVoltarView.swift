//
//  ConteudoVoltarView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 10/09/21.
//

import SwiftUI

struct ConteudoVoltarView: View {
    var body: some View {
        HStack (alignment: .center, spacing: 108) {
            
            Label("Voltar", systemImage: "chevron.backward")
                .onnaFont(.body)
                .foregroundColor(.onnaWhite)
                .padding(.top, 35)
            
            Text("BLOG")
                .onnaFont(.body)
                .foregroundColor(.onnaWhite)
                .padding(.top, 35)
            
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(.onnaWhite)
                .padding(.top, 35)
            
        }
        .padding()
    }
}

struct ConteudoVoltarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            ConteudoVoltarView()
        }
    }
}
