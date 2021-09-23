//
//  ChatAwnsers.swift
//  onna
//
//  Created by Deborah Santos on 10/09/21.
//

import SwiftUI

struct ChatAwnsersView: View {
    @State var comment: Comments
    
    var body: some View {
        HStack{
            Image(comment.userImage ?? "")
                .resizable()
                .clipShape(Circle())
                .frame(width: 40, height: 40)
                .foregroundColor(.onnaBlue)
                .padding(5)
            
            VStack (alignment:.leading){
                Text(comment.userName)
                    .onnaFont(.subheadline)
                    .foregroundColor(.onnaGreyStories)
                    .padding(.bottom, -7.0)
                
                Text(comment.text)
                    .onnaFont(.callout)
                    .foregroundColor(.onnaGreyStories)
                    .padding(.top, 4.0 )
                    .lineLimit(nil)
            }
        }
        .frame(width: 350, height: 80, alignment: .leading)
        .padding(.horizontal, 20)
    }
    
    struct ChatAwnsersView_Previews: PreviewProvider {
        static var previews: some View {
            ZStack { Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
                ChatAwnsersView(comment: Comments(id: 1, userImage: "Profile-Pic-3", userName: "Stel", text: "Esse é um comentário", canDelete: true))
            }
        }
    }
}
