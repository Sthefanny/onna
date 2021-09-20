//
//  TutorialJouneySheetView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 19/09/21.
//

import SwiftUI

struct TutorialJourneySheetView: View {
    @State var value = 0.0
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    var body: some View {
        VStack {
            VStack {
                Text("Jornada")
                    .onnaFont(.subheadline, textSize: 22)
                    .foregroundColor(.onnaBackgroundBlack)
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                    .frame(width: 385, height: 40, alignment: .leading)
                
                
                HStack {
                    Image("journey-icon")
                        .resizable()
                        .frame(width: 35, height: 35, alignment: .top)
                    
                    Text("Conheça mais o seu próprio corpo e desenvolva sua jornada de acorda com seus gostos e curiosidades.")
                        .onnaFont(.body, textSize: 15)
                        .foregroundColor(.onnaBackgroundBlack)
                        .padding(.leading, 10)
                        .frame(width: 260, height: 100, alignment: .leading)
                }
                .padding(.horizontal, 30)
                .frame(width: 385, height: 100, alignment: .leading)
            
                BlackButtonView(action: {
                    UserDefaults.standard.set(true, forKey: UserDefaultsKeys.hasViewedTutorialJourney.name)
                    self.viewControllerHolder?.dismiss(animated: true, completion: nil)
                }, buttonText: "Iniciar a jornada")
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

struct TutorialJouneySheetView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialJourneySheetView()
    }
}
