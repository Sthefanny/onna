//
//  ChallengeButtonView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 10/09/21.
//

import SwiftUI

struct ChallengeButtonView: View {
    var body: some View {
        Text("Bora escrever!")
            .onnaFont(.body)
            .foregroundColor(.onnaWhite).multilineTextAlignment(.center)
            .frame(width: 163, height: 41, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 50))
            .foregroundColor(.onnaBackgroundBlack)
            .padding(.top, 32)
    }
}

struct ChallengeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeButtonView()
    }
}
