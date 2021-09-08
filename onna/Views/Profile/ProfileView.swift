//
//  ProfileView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 08/09/21.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var offset = CGSize.zero
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Profile View")
            }
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }

                .onEnded { _ in
                    if self.offset.width > 0 {
                        self.offset = .zero
                        print("Esquerda: Entrou no onEnded 2 com \(self.offset.width) e com \(screenWidth)")
                        withAnimation {
                            viewRouter.previousPage = .profileView
                            viewRouter.currentPage = .homeView
                        }
                    }
                }
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
