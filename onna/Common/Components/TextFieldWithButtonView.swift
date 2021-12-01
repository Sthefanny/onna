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
    @State var textColor: Color?
    let size = UIScreen.main.bounds
    
    var body: some View {
        TextField("" , text: $text)
            .placeholder(when: text.isEmpty) {
                Text("Escreva seu nome ou apelido aqui").foregroundColor(textColor == nil ? .onnaWhite : textColor)
            }
            .onChange(of: text) { _ in
                UserDefaults.standard.set(text, forKey: UserDefaultsKeys.nickName.name)
            }
            .foregroundColor(textColor == nil ? .white : textColor)
            .modifier(GoButton(fieldName: $fieldName, text: $text, action: $action))
            .padding(.vertical, 8)
            .padding(.leading, size.width * 0.06)
            .padding(.trailing, 4)
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
