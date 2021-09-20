//
//  TutorialSheetView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 19/09/21.
//

import SwiftUI

struct TutorialDiscoverySheetView: View {
    @Binding var showModal: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Descobertas")
                    .onnaFont(.subheadline, textSize: 20)
                    .foregroundColor(.onnaBackgroundBlack)
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                    .frame(width: 385, height: 40, alignment: .leading)
                
                
                HStack {
                    Image("discovery-icon")
                        .resizable()
                        .frame(width: 35, height: 35, alignment: .top)
                    
                    Text("Para explorar e conhecer melhor o aplicativo, você pode usar swipe para os lados e descobrir as outras telas.")
                        .onnaFont(.body, textSize: 15)
                        .foregroundColor(.onnaBackgroundBlack)
                        .padding(.leading, 10)
                        .frame(width: 260, height: 100, alignment: .leading)
                }
                .padding(.horizontal, 30)
                .frame(width: 385, height: 100, alignment: .leading)
            
                BlackButtonView(action: {
                    self.showModal.toggle()
                }, buttonText: "Começar a explorar")
            }
            .frame(width: 385, height: 250, alignment: .topLeading)
            .background(RoundedRectangle(cornerRadius: 20))
            .foregroundColor(.white)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.gray.opacity(0.5))
    }
}

struct TutorialDiscoverySheetView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            TutorialDiscoverySheetView(showModal: .constant(true))
        }
    }
}
