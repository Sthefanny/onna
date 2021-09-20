//
//  LoadingView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 18/09/21.
//

import SwiftUI

struct LoadingView: View {
    
    @State var animate = false
    
    var body: some View {
        
        VStack(alignment: .center){
            Spacer()
            Image("Onna-Logo")
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
            Spacer()
            
        }
        .onAppear {
            self.animate.toggle()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
