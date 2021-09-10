//
//  TextFieldView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 10/09/21.
//

import SwiftUI

struct TextFieldView: View {
    
    @State var message: String = "Fale com o seu eu do futuro..."
    
    var body: some View {
        VStack (alignment: .leading, spacing: 32){
                    
                    TextEditor(text: $message)
                        .onnaFont(.callout)
                        .foregroundColor(.onnaBackgroundBlack)
                        .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .frame(width: 300, height: 120, alignment: .topLeading)
                        .background(RoundedRectangle(cornerRadius: 13))
                            .foregroundColor(.onnaGreyStories)
                    
            Text("Yas!")
                .onnaFont(.body)
                .foregroundColor(.onnaWhite).multilineTextAlignment(.center)
                .frame(width: 163, height: 41, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 50))
                .foregroundColor(.onnaBackgroundBlack)
                }
        
//        VStack {
//           TextEditor(text: $message)
//             .frame(height:300 / 3, alignment: .center)
//             .lineSpacing(10)
//             .autocapitalization(.words)
//             .disableAutocorrection(true)
//             .padding()
//
//        }.overlay(
//                 RoundedRectangle(cornerRadius: 25)
//                   .stroke(Color.yellow, lineWidth: 5)
//                 )
//        .padding()
        
        

        
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
