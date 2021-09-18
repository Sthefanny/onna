//
//  WallView.swift
//  onna
//
//  Created by Daniella Onishi on 09/09/21.
//

import SwiftUI

struct WallView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var viewModel: JourneyViewModel
    
    var body: some View {
        VStack {
            ForEach(0 ..< viewModel.journey.count) { i in
                StickerCell(stickerCellInfo: viewModel.journey[i], side: i % 2 == 0 ? .left : .right)
            }
            
        }
    }
}



struct StickerCellInfo: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var body: String
}

//struct WallView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
//            WallView()
//        }
//    }
//}


enum Side {
    case left
    case right
}
