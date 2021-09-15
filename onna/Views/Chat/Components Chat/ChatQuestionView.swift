//
//  ChatQuestionView.swift
//  onna
//
//  Created by Deborah Santos on 10/09/21.
//

import SwiftUI

struct ChatQuestionView: View {
//
    var body: some View {
        
        ZStack (alignment: .center){
            
           Text("Eu odeio as mudanças de humor que sofro durante a menstruação, odeio!!!! Tou farta de ter vagina.")
               .onnaFont(.body)
               .multilineTextAlignment(.center)
               .foregroundColor(.onnaWhite)
               .padding()
               .frame (width: 317, height: 164, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
               .padding()
               .overlay(
                
                
            RoundedRectangle(cornerRadius: 16)
               .stroke(Color.onnaWhite, lineWidth: 1))
               .padding(30)
        
        HStack{
                
           Text( "35 yays")
            .onnaFont(.callout)
            .multilineTextAlignment(.center)
            .foregroundColor(.onnaGreyStories)
            .offset(x: 0, y: 66)
                
            Image(systemName: "heart")
                .font(.system(size: 22))
                .foregroundColor(.onnaPink)
                .offset(x: 0, y: 66)
            }
        
           Ellipse()
            .frame(width: 70, height: 70)
            .foregroundColor(.onnaPink)
            .padding(.bottom, 198.0)
    
     
       }
        
    }

    struct ChatQuestionView_Previews: PreviewProvider {
        static var previews: some View {
            ZStack { Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
         ChatQuestionView()
        }
     }
  }
}
