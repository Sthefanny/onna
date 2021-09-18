//
//  HalfElipseQuizView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 15/09/21.
//

import SwiftUI

struct HalfElipseQuizView: View {
    
    @State var action: () -> Void
    let respostaNome: String
    let segundaRespostaNome: String
    
    var body: some View {
        HStack {
            ZStack {
                Button(action: {
                    self.action()
                }) {
                    Image("Quiz-Half")
                        .resizable()
                        .frame(width: 180, height: 180)
                }
                Text(respostaNome)
                    .onnaFont(.body)
                    .foregroundColor(.onnaWhite)
                    .frame(width: 130, height: 100, alignment: .center)
                    .rotationEffect(Angle(degrees: -45))
            }
            
            ZStack {
                Button(action: {
                    self.action()
                }) {
                    Image("Quiz-Half-2")
                        .resizable()
                        .frame(width: 180, height: 180)
                }
                Text(segundaRespostaNome)
                    .onnaFont(.body)
                    .foregroundColor(.onnaWhite)
                    .frame(width: 130, height: 100, alignment: .center)
                    .rotationEffect(Angle(degrees: -48))
            }
            
        }
        .padding(8)
    }
}

struct HalfElipseQuizView_Previews: PreviewProvider {
    static var previews: some View {
        HalfElipseQuizView(action: {}, respostaNome: "Verdadeiro", segundaRespostaNome: "Falso")
    }
}
