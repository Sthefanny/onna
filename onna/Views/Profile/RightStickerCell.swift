//
//  RightStickerCell.swift
//  onna
//
//  Created by Daniella Onishi on 10/09/21.
//

import SwiftUI

struct RightStickerCell: View {
    var stickerCellInfo: StickerCellInfo
    var body: some View {
        HStack {
            VStack(alignment: .trailing) {
                Text(stickerCellInfo.title)
                    .onnaFont(OnnaFontSystem.TextStyle.title2)
                    .foregroundColor(.onnaWhite)
                Text(stickerCellInfo.body)
                    .onnaFont(OnnaFontSystem.TextStyle.callout)
                    .foregroundColor(.onnaWhite)
            }
            Image(stickerCellInfo.image)
                .resizable()
                .frame(width: 140, height: 130, alignment: .center)
                .padding(.leading, 15)
        }.frame(width: 370, height: 130, alignment: .center)
    }
}

struct RightStickerCell_Previews: PreviewProvider {
    static var previews: some View {
        RightStickerCell(stickerCellInfo: StickerCellInfo(image: "", title: "", body: ""))
    }
}
