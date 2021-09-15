//
//  TextFieldWithButtonView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct TextFieldWithButtonView: View {
    @State var fieldName: String
    @State private var text: String = ""
    @State var action: () -> Void
    
    var body: some View {
        TextField("" , text: $text)
            .placeholder(when: text.isEmpty) {
                Text("Escreva seu nome ou apelido aqui").foregroundColor(.onnaWhite)
            }
            .onChange(of: text) { _ in
                UserDefaults.standard.set(text, forKey: UserDefaultsKeys.nickName.name)
            }
            .foregroundColor(.white)
            .modifier(GoButton(fieldName: $fieldName, text: $text, action: $action))
            .padding(.vertical, 8)
            .padding(.leading, 20)
            .padding(.trailing, 8)
            .background(RoundedRectangle(cornerRadius: 30))
            .foregroundColor(.onnaWhite)
    }
    
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct GoButton: ViewModifier {
    @Binding var fieldName: String
    @Binding var text: String
    @Binding var action: () -> Void
    @State private var showErrorAlert: Bool = false

    public func body(content: Content) -> some View
    {
        ZStack(alignment: .trailing)
        {
            content
            
            NextRoundedButtonView(fieldName: self.fieldName, action: self.action, hasError: .constant(text.isEmpty))
        }
    }
}

struct TextFieldWithButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.onnaPink.edgesIgnoringSafeArea(.all)
            TextFieldWithButtonView(fieldName: "", action: {})
        }
    }
}
