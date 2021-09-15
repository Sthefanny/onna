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
    
    var body: some View {
        HStack {
            ZStack {
                Button(action: {
                    self.action()
                }) {
                    Image("Quiz-Half")
                        .resizable()
                        .frame(width: 215, height: 215)
                }
                Text(respostaNome)
                    .onnaFont(.body)
                    .foregroundColor(.onnaWhite)
                    .frame(width: 130, height: 100, alignment: .center)
                    .rotationEffect(Angle(degrees: -45))
            }
        }
        .padding(8)
    }
}

struct HalfElipseQuizView_Previews: PreviewProvider {
    static var previews: some View {
        HalfElipseQuizView(action: {}, respostaNome: "Verdadeiro")
    }
}
