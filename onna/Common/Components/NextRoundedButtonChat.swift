//
//  NextRoundedButtonChat.swift
//  onna
//
//  Created by Deborah Santos on 10/09/21.
//

import SwiftUI

struct NextRoundedButtonChat: View {
    @State var fieldName: String
    @State var action: () -> Void
    @Binding var hasError: Bool
    @State private var showErrorAlert: Bool = false
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                if hasError {
                    showErrorAlert = true
                } else {
                    self.action()
                }
            }, label: {
                Image(systemName: "bubble.left")
                    .font(.system(size: 22))
                    .foregroundColor(.onnaWhite)
                    .frame(width: 12, height: 12, alignment: .center)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.onnaBlue)
                            .shadow(color: .gray, radius: 4, x: 0, y: 4)
                    )
            })
            
        }
    }
}


struct NextRoundedButtonChat_Previews: PreviewProvider {
    static var previews: some View {
        NextRoundedButtonChat(fieldName: "Teste", action: {}, hasError: .constant(false))
    }
}
