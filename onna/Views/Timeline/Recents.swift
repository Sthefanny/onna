//
//  Recents.swift
//  onna
//
//  Created by Daniella Onishi on 14/09/21.
//

import SwiftUI

struct Recents: View {
    var recentsInfo: RecentsInfo
    @State var isLiked = false
    
    var body: some View {
        
        VStack {
            VStack {
                HStack {
                    
                    Image(recentsInfo.profilePic)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50, alignment: .center)
                        .cornerRadius(15)
                    
                    Text(recentsInfo.userComment)
                        .onnaFont(.callout)
                        .padding(.leading,30)
                        .padding(.trailing,30)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        isLiked.toggle()
                    }) {
                        Image(systemName: isLiked == false ?  "heart" : "heart.fill")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(.onnaPink)
                    }
                    
                    
                    Text("Yays")
                        .onnaFont(.callout)
                        .foregroundColor(.onnaWhite)
                    
                }
            }
            Divider()
                .frame(width: 340, height: 1.5, alignment: .center)
                .foregroundColor(.onnaMainGrey)
            
        }
        
    }
    
}

struct RecentsInfo: Identifiable {
    var id = UUID()
    
    var profilePic: String
    var userComment: String
}

struct Recents_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.onnaBackgroundBlack
                .ignoresSafeArea()
            Recents(recentsInfo: RecentsInfo(profilePic: "Woman-1", userComment: "Comment Comment"))
        }
    }
}
