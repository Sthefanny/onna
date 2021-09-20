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
    let internalPadding: CGFloat
    var callback: (Bool) -> Void
    
    init(placeholder: String, message: String, internalPadding: CGFloat = 5, callback: @escaping (Bool) -> Void) {
        self.placeholder = placeholder
        self.message = message
        self.internalPadding = internalPadding
        self.callback = callback
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        VStack (alignment: .center, spacing: 32){
            
            ZStack (alignment: .topLeading){
                TextEditor(text: $message)
                    .padding()
                    .background(Color.onnaTextEditor)
                    .foregroundColor(Color.black.opacity(0.4))
                    .onnaFont(.callout)
                    .frame(width: 330, height: 120, alignment: .topLeading)
                    .cornerRadius(13)
                
                if message.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color.onnaGreyBoxes.opacity(0.4))
                        .onnaFont(.callout)
                        .padding(EdgeInsets(top:20, leading: 15, bottom: 20, trailing: 15))
                        .padding(internalPadding)
                }
            }
            Button(action: {
                self.callback(true)
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
        ZStack {
            Color.onnaGreyContent.edgesIgnoringSafeArea(.all)
            TextFieldView(placeholder: "Fale com o seu eu do futuro...", message: "", callback: {isSuccess in})
        }
    }
}
