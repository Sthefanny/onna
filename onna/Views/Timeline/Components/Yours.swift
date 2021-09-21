//
//  Yours.swift
//  onna
//
//  Created by Daniella Onishi on 14/09/21.
//

import SwiftUI

struct Yours: View {
    var defaultText = "Você ainda não tem nada publicado nos chats, crie uma nova pergunta ou conversa para interagir com as outras pessoas."
    var body: some View {
        
        VStack {
            Text(defaultText)
                .onnaFont(.body)
                .foregroundColor(.onnaMainGrey)
                .padding(60)
        }
    }
}

struct Yours_Previews: PreviewProvider {
    static var previews: some View {
        Yours()
    }
}
