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
    @Binding var isSuccess: Bool
    @State var postId: Int
    var callback: (Bool) -> Void
    
    var body: some View {
        TextField("" , text: $text)
            .placeholder(when: text.isEmpty) {
                Text("Escreva aqui").foregroundColor(.onnaWhite)
            }
            .foregroundColor(.white)
            .modifier(ChatButton(fieldName: $fieldName, text: $text, isSuccess: $isSuccess, postId: postId, callback: callback))
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
    @Binding var isSuccess: Bool
    @State private var showErrorAlert: Bool = false
    @State var postId: Int
    var callback: (Bool) -> Void
    
    public func body(content: Content) -> some View
    {
        ZStack(alignment: .trailing)
        {
            content
            
            NextRoundedButtonChat(fieldName: self.fieldName, isSuccess: self.$isSuccess, hasError: .constant(text.isEmpty), postId: self.postId, text: self.$text, callback: self.callback)
        }
    }
}


struct TextFieldWithButtonChat_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            TextFieldWithButtonChat (fieldName: "", isSuccess: .constant(true), postId: 1, callback: {isSuccess in})
        }
    }
}
