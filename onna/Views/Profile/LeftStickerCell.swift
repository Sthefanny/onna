//
//  LeftStickerCell.swift
//  onna
//
//  Created by Daniella Onishi on 10/09/21.
//

import SwiftUI

struct LeftStickerCell: View {
    var stickerCellInfo: StickerCellInfo
    var body: some View {
        HStack {
            Image(stickerCellInfo.image)
                .resizable()
                .frame(width: 140, height: 130, alignment: .center)
                .padding(.trailing, 15)
            VStack(alignment: .leading) {
                Text(stickerCellInfo.title)
                    .onnaFont(OnnaFontSystem.TextStyle.title2)
                    .foregroundColor(.onnaWhite)
                Text(stickerCellInfo.body)
                    .onnaFont(OnnaFontSystem.TextStyle.callout)
                    .foregroundColor(.onnaWhite)
            }   
        }.frame(width: 370, height: 130, alignment: .center)
    }
}

struct LeftStickerCell_Previews: PreviewProvider {
    static var previews: some View {
        LeftStickerCell(stickerCellInfo: StickerCellInfo(image: "", title: "", body: ""))
    }
}
