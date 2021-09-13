//
//  ChatAwnsers.swift
//  onna
//
//  Created by Deborah Santos on 10/09/21.
//

import SwiftUI

struct ChatAwnsersView: View {
    
    var body: some View {
    
        HStack{
       
            Ellipse()
                .frame(width: 34, height: 34)
                .foregroundColor(.onnaBlue)
                .padding(5)

            VStack (alignment:.leading){
                Text  ("Fulana")
                    .onnaFont(.subheadline)
                    .foregroundColor(.onnaGreyStories)
                    .padding(.bottom, -7.0)

            Text ("Realmente uma das piores coisas da vida")
                    .onnaFont(.callout)
                    .foregroundColor(.onnaGreyStories)
                .padding([.top, .trailing], 4.0 )
           }
       }
   }

    struct ChatAwnsersView_Previews: PreviewProvider {
        static var previews: some View {
            ZStack { Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
         ChatAwnsersView()
            }
    }
  }
}
