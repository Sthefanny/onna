//
//  ChallengeButtonView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 10/09/21.
//

import SwiftUI

struct BlackButtonView: View {
    
    @State var action: () -> Void
    let buttonText: String
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
                    Text(buttonText)
                        .onnaFont(.body)
                        .foregroundColor(.onnaWhite).multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(RoundedRectangle(cornerRadius: 50))
                        .foregroundColor(.onnaBackgroundBlack)
        })
    }
}

struct ChallengeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BlackButtonView(action: {}, buttonText: "Bora escrever!")
    }
}
