//
//  TextFieldView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 10/09/21.
//

import SwiftUI

struct TextFieldView: View {
    
    let placeholder: String
    @State var message: String
    let internalPadding: CGFloat = 5
    @State var action: () -> Void
    
    var body: some View {
        VStack (alignment: .center, spacing: 32){
            
            ZStack (alignment: .topLeading){
                TextEditor(text: $message)
                    .frame(width: 330, height: 120, alignment: .topLeading)
                    .cornerRadius(13.0)
                    .colorMultiply(.onnaGreyStories)
                    .onnaFont(.callout)
                    .padding(internalPadding)
                
                if message.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color.onnaGreyBoxes.opacity(0.4))
                        .onnaFont(.callout)
                        .padding(EdgeInsets(top:7, leading: 4, bottom: 0, trailing: 0))
                        .padding(internalPadding)
                }
            }
            Button(action: {
                self.action()
            }, label: {
                        Text("Yas!")
                            .onnaFont(.body)
                            .foregroundColor(.onnaWhite).multilineTextAlignment(.center)
                            .frame(width: 163, height: 41, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 50))
                            .foregroundColor(.onnaBackgroundBlack)
                            .padding(.bottom, 32)
            })
        }
        
        
        
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(placeholder: "Fale com o seu eu do futuro...", message: "", action: {})
    }
}
