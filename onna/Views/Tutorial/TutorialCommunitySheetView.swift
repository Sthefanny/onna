//
//  TutorialCommunitySheetView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 19/09/21.
//

import SwiftUI

struct TutorialCommunitySheetView: View {
    @State var value = 0.0
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    var body: some View {
        VStack {
            VStack {
                Text("Comunidade")
                    .onnaFont(.subheadline, textSize: 22)
                    .foregroundColor(.onnaBackgroundBlack)
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                    .frame(width: 385, height: 40, alignment: .leading)
                
                
                HStack {
                    Image("community-icon")
                        .resizable()
                        .frame(width: 35, height: 35, alignment: .top)
                    
                    Text("Seja livre para compartilhar perguntas e depoimentos ou acompanhe e faça o conteúdo de outras garotas brilhar!")
                        .onnaFont(.body, textSize: 15)
                        .foregroundColor(.onnaBackgroundBlack)
                        .padding(.leading, 10)
                        .frame(width: 260, height: 100, alignment: .leading)
                }
                .padding(.horizontal, 30)
                .frame(width: 385, height: 100, alignment: .leading)
            
                BlackButtonView(action: {
                    UserDefaults.standard.set(true, forKey: UserDefaultsKeys.hasViewedTutorialCommunity.name)
                    self.viewControllerHolder?.dismiss(animated: true, completion: nil)
                }, buttonText: "Começar a conversar")
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

struct TutorialCommunitySheetView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialCommunitySheetView()
    }
}
