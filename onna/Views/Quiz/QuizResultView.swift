//
//  QuizResultView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 18/09/21.
//

import SwiftUI

struct QuizResultView: View {
    var body: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            VStack {
                ConteudoVoltarView(conteudoName: "QUIZ")
                    .padding(.top, -40)
                
                Text("Resultado")
            }
        }
    }
}

struct QuizResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultView()
    }
}
