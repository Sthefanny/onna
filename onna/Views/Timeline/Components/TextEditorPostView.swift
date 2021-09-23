//
//  TextEditorCustomView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 18/09/21.
//

import SwiftUI

struct TextEditorPostView: View {
    @ObservedObject var viewModel = PostViewModel()
    @State var message = ""
    @State private var showErrorAlert: Bool = false
    var callback: (Bool) -> Void
    
    init(callback: @escaping (Bool) -> Void) {
        UITextView.appearance().backgroundColor = .clear
        self.callback = callback
    }
    
    var body: some View {
        ZStack {
            ZStack (alignment: .topLeading){
                TextEditor(text: $message)
                    .padding()
                    .background(Color.onnaGreyBoxes)
                    .foregroundColor(Color.onnaWhite.opacity(0.8))
                    .onnaFont(.callout)
                    .frame(width: 335, height: 120, alignment: .topLeading)
                    .cornerRadius(20)
                
                if message.isEmpty {
                    Text("Escreva aqui o que te aflinge...")
                        .foregroundColor(Color.onnaWhite.opacity(0.4))
                        .onnaFont(.callout)
                        .padding(EdgeInsets(top:25, leading: 20, bottom: 20, trailing: 15))
                }
            }
            
            ZStack (alignment: .bottomTrailing) {
                Button(action: {
                    if (message != "") {
                        viewModel.addPost(text: message) { isSuccess in
                            if (isSuccess) {
                                message = ""
                                self.hideKeyboard()
                            } else {
                                showErrorAlert = true
                            }
                            
                            self.callback(isSuccess)
                        }
                    }
                }) {
                    Image("Send-Message")
                }
            }
            .frame(width: 335, height: 120, alignment: .bottomTrailing)
        }
        .alert(isPresented: $showErrorAlert, content: {
            Alert(title: Text("Eita.."), message: Text("Ocorreu um problema. Tente novamente em alguns minutos"), dismissButton: .default(Text("Ok")))
        })
    }
}

struct TextEditorCustomView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            TextEditorPostView(callback: {isSuccess in})
        }
    }
}
