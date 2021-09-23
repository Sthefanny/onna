//
//  NextRoundedButtonChat.swift
//  onna
//
//  Created by Deborah Santos on 10/09/21.
//

import SwiftUI

struct NextRoundedButtonChat: View {
    @ObservedObject var viewModel = PostViewModel()
    @State var fieldName: String
    @Binding var isSuccess: Bool
    @Binding var hasError: Bool
    @State private var showErrorAlert: Bool = false
    @State var postId: Int
    @Binding var text: String
    var callback: (Bool) -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                if hasError {
                    showErrorAlert = true
                } else {
                    if (text != "") {
                        viewModel.addComment(postId: postId, text: text) { isSuccess in
                            self.isSuccess = isSuccess
                            self.text = ""
                            self.hideKeyboard()
                            self.callback(isSuccess)
                        }
                    }
                }
            }, label: {
                Image(systemName: "bubble.left")
                    .font(.system(size: 22))
                    .foregroundColor(.onnaWhite)
                    .frame(width: 12, height: 12, alignment: .center)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.onnaBlue)
                            .shadow(radius: 4, x: 0, y: 4)
                    )
            })
            
        }
    }
}


struct NextRoundedButtonChat_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            NextRoundedButtonChat(fieldName: "Teste", isSuccess: .constant(true), hasError: .constant(false), postId: 1, text: .constant("aaa"), callback: {isSuccess in})
        }
    }
}
