//
//  TutorialSheetView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 19/09/21.
//

import SwiftUI

struct TutorialDiscoverySheetView: View {
    @State var value = 0.0
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    var body: some View {
        VStack {
            VStack {
                Text("Descobertas")
                    .onnaFont(.subheadline, textSize: 22)
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
                    UserDefaults.standard.set(true, forKey: UserDefaultsKeys.hasViewedTutorialDiscovery.name)
                    self.viewControllerHolder?.dismiss(animated: true, completion: nil)
                }, buttonText: "Começar a explorar")
            }
            .frame(width: 385, height: 250, alignment: .topLeading)
            .foregroundColor(.white)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.white).clipShape(RoundedRectangle(cornerRadius: 30))
        .frame(width: UIScreen.main.bounds.size.width - 32)
        .shadow(radius: 3)
        .offset(x: 0, y: 300)
    }
}

struct TutorialDiscoverySheetView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            TutorialDiscoverySheetView()
        }
    }
}
