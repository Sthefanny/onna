//
//  TextFieldWithButtonView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct TextFieldWithButtonView: View {
    @State var text: String
    
    var body: some View {
        TextField("" , text: $text)
            .placeholder(when: text.isEmpty) {
                    Text("Escreva seu nome ou apelido aqui").foregroundColor(.onnaWhite.opacity(0.8))
            }
            .foregroundColor(.white)
            .modifier(ClearButton(text: $text))
            .padding(.vertical, 8)
            .padding(.leading, 20)
            .padding(.trailing, 8)
            .background(RoundedRectangle(cornerRadius: 30))
            .foregroundColor(.onnaWhite.opacity(0.4))
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

struct ClearButton: ViewModifier
{
    @Binding var text: String

    public func body(content: Content) -> some View
    {
        ZStack(alignment: .trailing)
        {
            content

            NextRoundedButtonView(action: {})
        }
    }
}

struct TextFieldWithButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.onnaPink.edgesIgnoringSafeArea(.all)
            TextFieldWithButtonView(text: "")
        }
    }
}
