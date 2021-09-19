//
//  Chat01View.swift
//  onna
//
//  Created by Deborah Santos on 09/09/21.

//duvidinhas: crio um componente pra esse text field?
//crio um componente pras respostas (chat?)
// N consigo mudar a cor do "escreva aqui"

import SwiftUI



struct ChatView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var viewModel = PostViewModel()
    @State var postId: Int
    @State var isSuccess = false
    
    init(_ postId: Int) {
        self.postId = postId
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            VStack{
                Button(action: {
                    viewRouter.currentPage = viewRouter.previousPage
                }, label: {
                    HStack {
                        Spacer()
                        Text("Voltar")
                            .font(.body)
                            .foregroundColor(.onnaWhite)
                        
                        Image (systemName: "chevron.forward")
                            .foregroundColor(.onnaWhite)
                    }
                    .padding(.trailing, 35)
                })
                
                if (viewModel.postWithComments != nil) {
                    ChatQuestionView(post: viewModel.postWithComments!)
                    
                    if (viewModel.postWithComments!.comments != nil) {
                        ScrollView {
                            ForEach(viewModel.postWithComments!.comments!) { comment in
                                ChatAwnsersView(comment: comment)
                            }
                        }
                    }
                }
                
                Spacer ()
                
                if (viewModel.postWithComments != nil) {
                    TextFieldWithButtonChat (fieldName: "Nome", isSuccess: $isSuccess, postId: viewModel.postWithComments!.id, callback: { isSuccess in
                        if (self.isSuccess) {
                            viewModel.fetchPostWithComments(postId: postId) { isSuccess in}
                        }
                    })
                    .padding(.horizontal, 20)
                }
            }
        }
        .onAppear {
            viewModel.fetchPostWithComments(postId: postId) { isSuccess in}
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView (1)
    }
}


