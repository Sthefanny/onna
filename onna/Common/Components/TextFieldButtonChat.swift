//
//  TextFieldButtonChat.swift
//  onna
//
//  Created by Deborah Santos on 10/09/21.
//

import SwiftUI

struct TextFieldWithButtonChat: View {
    @State var fieldName: String
    @State private var text: String = ""
    @State var action: () -> Void
    
    var body: some View {
        TextField("" , text: $text)
            .placeholder(when: text.isEmpty) {
                Text("Escreva aqui").foregroundColor(.onnaWhite)
            }
            .onChange(of: text) { _ in
                UserDefaults.standard.set(text, forKey: UserDefaultsKeys.nickName.name)
            }
            .foregroundColor(.white)
            .modifier(ChatButton(fieldName: $fieldName, text: $text, action: $action))
            .padding(.vertical, 8)
            .padding(.leading, 20)
            .padding(.trailing, 8)
            .background(RoundedRectangle(cornerRadius: 30))
            .foregroundColor(.onnaMainGrey)
    }
    
}
struct ChatButton: ViewModifier {
    @Binding var fieldName: String
    @Binding var text: String
    @Binding var action: () -> Void
    @State private var showErrorAlert: Bool = false

    public func body(content: Content) -> some View
    {
        ZStack(alignment: .trailing)
        {
            content
            
            NextRoundedButtonChat(fieldName: self.fieldName, action: self.action, hasError: .constant(text.isEmpty))
        }
    }
}


struct TextFieldWithButtonChat_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            TextFieldWithButtonChat (fieldName: "", action: {})
        }
    }
}
