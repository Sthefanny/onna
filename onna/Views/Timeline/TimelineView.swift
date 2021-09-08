//
//  TimelineView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 08/09/21.
//

import SwiftUI

struct TimelineView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var offset = CGSize.zero
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Timeline View")
            }
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }

                .onEnded { _ in
                    if self.offset.width < 0 {
                        print("Direita: Entrou no onEnded 1 com \(self.offset.width) e com \(screenWidth)")
                        withAnimation {
                            viewRouter.previousPage = .timelineView
                            viewRouter.currentPage = .homeView
                        }
                    }
                }
        )
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
