//
//  YaysConteudoView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 14/09/21.
//

import SwiftUI

struct YaysConteudoView: View {
    var body: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            VStack (alignment: .leading, spacing: 32) {
                Spacer()
                
                FavoriteView(action: {}, buttonText: "Body Positive", iconConteudo: "IconBlog")
                FavoriteView(action: {}, buttonText: "Feminismo", iconConteudo: "IconQuiz")
                FavoriteView(action: {}, buttonText: "Amizades Tóxicas", iconConteudo: "IconQuiz")
                FavoriteView(action: {}, buttonText: "Meditação", iconConteudo: "IconChallenge")
                FavoriteView(action: {}, buttonText: "Comunidade", iconConteudo: "IconBlog")
                FavoriteView(action: {}, buttonText: "Relacionamento", iconConteudo: "IconQuiz")
            }
        }
    }
}

struct YaysConteudoView_Previews: PreviewProvider {
    static var previews: some View {
        YaysConteudoView()
    }
}
