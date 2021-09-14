//
//  FavoriteView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 14/09/21.
//

import SwiftUI

struct FavoriteView: View {
    
    @State var action: () -> Void
    let buttonText: String
    let iconConteudo: String
    @State var didTap : Bool = false
    
    var body: some View {
        HStack {
            
            Button(action: {
                self.action()
            }, label: {
                Image(iconConteudo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color.onnaPink)
                    .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 8))
                
                Text (buttonText)
                    .onnaFont(.title1)
                    .foregroundColor(.onnaGreyStories)
                    .frame(width: 220, height: 24, alignment: .leading)
                
            })
            
            Button(action: {
                self.didTap.toggle()
            }) {
                Image(systemName: self.didTap == true ? "heart" : "heart.fill")
                    .imageScale(.large)
                    .foregroundColor(Color.onnaPink)
                    .padding(.init(top: 0, leading: 32, bottom: 0, trailing: 20))
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            FavoriteView(action: {}, buttonText: "Amor", iconConteudo: "IconQuiz")
        }
    }
}
