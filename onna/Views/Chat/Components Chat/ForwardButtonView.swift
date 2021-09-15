//
//  ForwardButtonView.swift
//  onna
//
//  Created by Deborah Santos on 13/09/21.
//

import SwiftUI

struct ForwardButtonView: View {
    
    var body: some View {
        
        HStack{
            
            Text("Voltar")
                .font(.body)
                .foregroundColor(.onnaWhite)
            
            Image (systemName: "chevron.forward")
                .foregroundColor(.onnaWhite)
              
            
        }
        .padding(.leading)
        
        
        
        
            
    }
    struct ForwardButtonView_Previews: PreviewProvider {
        static var previews: some View {
            ZStack { Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
                ForwardButtonView()
}
        
        }
    }
}
