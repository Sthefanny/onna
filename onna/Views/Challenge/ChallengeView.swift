//
//  ChallengeView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 09/09/21.
//

import SwiftUI

//struct Challenges: Decodable {
//    let id: Int
//    let journeyId: Int
//    let title: String
//    let description: String
//    let tip: String
//}

struct ChallengeView: View {
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.onnaWhite)
                    .frame(width: 390, height: 730, alignment: .bottom)
                    .padding(.top, 100)
    
            }
            
        }
    }
    
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
