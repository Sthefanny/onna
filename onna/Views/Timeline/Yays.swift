//
//  Yays.swift
//  onna
//
//  Created by Daniella Onishi on 14/09/21.
//

import SwiftUI

struct Yays: View {
    var defaultText = "Você ainda não tem deu yay em nenhuma publicação."
    var body: some View {
        VStack {
            Text(defaultText)
                .onnaFont(.body)
                .foregroundColor(.onnaMainGrey)
                .padding(60)
        }
    }
}

struct Yays_Previews: PreviewProvider {
    static var previews: some View {
        Yays()
    }
}
