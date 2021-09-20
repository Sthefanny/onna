//
//  Recents.swift
//  onna
//
//  Created by Daniella Onishi on 14/09/21.
//

import SwiftUI

struct Recents: View {
    var post: Post
    
    var body: some View {
        
        VStack  {
            VStack {
                HStack {
                    Image(post.userImage ?? "")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 43, height: 43, alignment: .center)
                        .cornerRadius(15)
                    
                    Text(post.text)
                        .onnaFont(.callout)
                        .foregroundColor(.white)
                        .frame(width: 220, height: 60, alignment: .topLeading)
                        .padding(.horizontal, 5)
                    
                    VStack {
                        HStack {
                            Image(post.hasLiked ?  "Icon-Star-White-Fill" : "Icon-Star-White")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(.onnaPink)
                            Text("\(post.likeQuantity)")
                                .onnaFont(.callout, textSize: 12)
                                .foregroundColor(.onnaWhite)
                        }
                        
                        HStack {
                            Image(systemName: "bubble.left")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(.white)
                            
                            Text("\(post.commentQuantity)")
                                .onnaFont(.callout, textSize: 12)
                                .foregroundColor(.onnaWhite)
                        }
                    }
                }
                .frame(width: 390, height: 60, alignment: .center)
            }
            Divider()
                .frame(width: 390, height: 1.5, alignment: .center)
                .foregroundColor(.onnaMainGrey)
            
        }
        
    }
    
}

struct Recents_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.onnaBackgroundBlack
                .ignoresSafeArea()
            Recents(post: Post(id: 0, userImage: "Woman-1", userName: "Stel", text: "teste", likeQuantity: 10, commentQuantity: 18, hasLiked: false, canDelete: false, comments: nil))
        }
    }
}
