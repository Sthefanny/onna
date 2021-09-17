//
//  RightStickerCell.swift
//  onna
//
//  Created by Daniella Onishi on 10/09/21.
//

import SwiftUI

struct StickerCell: View {
    var stickerCellInfo: Journey
    var side: Side
    
    var body: some View {
        switch side {
        case .left:
            HStack {
                Image(stickerCellInfo.image)
                    .resizable()
                    .frame(width: 110, height: 100, alignment: .center)
                    .transformEffect(CGAffineTransform(rotationAngle: -10 * (.pi / 180)))
                    .transformEffect(CGAffineTransform(translationX: 0, y: 20))
                VStack(alignment: .leading) {
                    Text(stickerCellInfo.title)
                        .onnaFont(.title2)
                        .foregroundColor(.onnaWhite)
                    Text(stickerCellInfo.description)
                        .onnaFont(.callout)
                        .foregroundColor(.onnaWhite)
                }
                .frame(width: 200, height: 100, alignment: .center)
                .padding(.leading, 25)
            }
            .frame(width: 370, height: 130, alignment: .center)
        case .right:
            HStack {
                VStack(alignment: .leading) {
                    Text(stickerCellInfo.title)
                        .onnaFont(.title2)
                        .foregroundColor(.onnaWhite)
                    Text(stickerCellInfo.description)
                        .onnaFont(.callout)
                        .foregroundColor(.onnaWhite)
                }
                .frame(width: 200, height: 100, alignment: .center)
                .padding(.trailing, 25)
                Image(stickerCellInfo.image)
                    .resizable()
                    .frame(width: 110, height: 100, alignment: .center)
                    .transformEffect(CGAffineTransform(rotationAngle: 10 * (.pi / 180)))
                    .transformEffect(CGAffineTransform(translationX: 0, y: -10))
            }
            .frame(width: 370, height: 130, alignment: .center)
        }
        
    }
}

struct StickerCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            let journey = Journey(id: 0, image: "girl-power-quiz", title: "Title", description: "Tudo o que acontece com o seu corpo durante a menstruação", challenges: nil, blogs: nil, quizes: nil, dynamicResults: nil)
            StickerCell(stickerCellInfo: journey, side: .left)
        }
    }
}
