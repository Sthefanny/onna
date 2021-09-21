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
            if (viewModel.completedJourneys.count == 0) {
                Text("Ainda não tem nada no seu mural. Complete alguma jornada para começar a criar seu mural!")
                    .onnaFont(.body)
                    .foregroundColor(.onnaMainGrey)
                    .frame(width: 300, height: 100, alignment: .top)
                    .padding(30)
            } else {
                ScrollView {
                    ForEach(0 ..< viewModel.completedJourneys.count) { i in
                        StickerCell(stickerCellInfo: viewModel.completedJourneys[i], side: i % 2 == 0 ? .left : .right)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchCompletedJourneys{_ in}
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
