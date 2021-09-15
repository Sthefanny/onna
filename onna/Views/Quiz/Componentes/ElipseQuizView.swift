//
//  ElipseQuizView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 15/09/21.
//

import SwiftUI

struct ElipseQuizView: View {
    
    @State var action: () -> Void
    let respostaNome: String
    
    
    var body: some View {
        HStack {
            ZStack {
                Button(action: {
                    self.action()
                }) {
                    Image("ElipseQuiz")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
                Text(respostaNome)
                    .onnaFont(.body)
                    .foregroundColor(.onnaWhite)
                    .multilineTextAlignment(.center)
                    .frame(width: 110, height: 120, alignment: .center)
            }
        }
        .padding(8)
    }
}

struct ElipseQuizView_Previews: PreviewProvider {
    static var previews: some View {
        ElipseQuizView(action: {}, respostaNome: "Exercício Físico")
    }
}
