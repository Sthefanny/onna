//
//  ChatQuestionView.swift
//  onna
//
//  Created by Deborah Santos on 10/09/21.
//

import SwiftUI

struct ChatQuestionView: View {
    @ObservedObject var viewModel = PostViewModel()
    @State var post: Post
    @State var hasLiked = false
    
    var body: some View {
        
        ZStack (alignment: .center){
            
            VStack {
                Text(post.userName)
                    .onnaFont(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.onnaWhite)
                    .offset(x: 0, y: 10)
                
                Text(post.text)
                    .onnaFont(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.onnaWhite)
                    .padding(.vertical)
                    .frame(width: 317, height: 80, alignment: .center)
                    .offset(x: 0, y: 5)
                
                Button(action: {
                    if (post.hasLiked) {
                        viewModel.dislike(postId: post.id) { isSuccess in
                            if(isSuccess) {
                                hasLiked.toggle()
                            }
                        }
                    } else {
                        viewModel.like(postId: post.id) { isSuccess in
                            if(isSuccess) {
                                hasLiked.toggle()
                            }
                        }
                    }
                }, label: {
                    HStack {
                        Image(systemName: hasLiked ? "heart.fill" : "heart")
                            .font(.system(size: 20))
                            .foregroundColor(.onnaPink)
                        
                        Text("\(post.likeQuantity) yays")
                            .onnaFont(.callout, textSize: 13)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.onnaGreyStories)
                    }
                    .offset(x: 0, y: 20)
                })
            }
            .frame (width: 317, height: 180, alignment: .center)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.onnaWhite, lineWidth: 1)
            )
            .padding(30)
            .padding(.bottom, 0)
            
            Image(post.userImage ?? "")
                .resizable()
                .clipShape(Circle())
                .frame(width: 70, height: 70)
                .foregroundColor(.onnaPink)
                .offset(x: 0, y: -105)
        }
        .onAppear{
            hasLiked = post.hasLiked
        }
    }
    
    struct ChatQuestionView_Previews: PreviewProvider {
        static var previews: some View {
            ZStack { Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
                ChatQuestionView(post: Post(id: 1, userImage: "Profile-Pic-3", userName: "Teste", text: "Eu odeio as mudanças de humor que sofro durante a menstruação, odeio!!!", likeQuantity: 24, commentQuantity: 15, hasLiked: true, canDelete: true, comments: nil))
            }
        }
    }
}
