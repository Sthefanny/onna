//
//  NextRoundButton.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct NextRoundedButtonView: View {
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
                Image(systemName: "chevron.right")
                    .font(.system(size: 22))
                    .foregroundColor(.onnaBackgroundBlack)
                    .frame(width: 12, height: 12, alignment: .center)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.white)
                            .shadow(radius: 4, x: 0, y: 4)
                    )
            })
            .alert(isPresented: $showErrorAlert, content: {
                Alert(title: Text("Campo obrigatório"), message: Text("Por favor, preencha o campo \(fieldName)."), dismissButton: .default(Text("Ok")))
            })
        }
    }
}

struct NextRoundedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NextRoundedButtonView(fieldName: "Teste", action: {}, hasError: .constant(false))
    }
}
