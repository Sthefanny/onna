//
//  WallView.swift
//  onna
//
//  Created by Daniella Onishi on 09/09/21.
//

import SwiftUI

struct WallView: View {
   
    
    var body: some View {
        VStack {
            RightStickerCell(stickerCellInfo: StickerCellInfo(image: "Message-Sticker", title: "Mensagem", body: "Quando você precisar de companhia, se dê o carinho que você precisa. Não se ignora, se ame <3"))
                
            
            LeftStickerCell(stickerCellInfo: StickerCellInfo(image: "Sexuality-Sticker", title: "Sexualidade", body: "Todo mundo tem direito de viver a sua sexualidade? Sim! E você aprendeu mais sobre a sua aqui"))
                
            
            RightStickerCell(stickerCellInfo: StickerCellInfo(image: "Menstruation-Sticker", title: "Menstruação", body: "A menstruação é uma jornada que pode ser preocupante e que incomoda, mas você pode fazê-la melhor"))
                
            
            LeftStickerCell(stickerCellInfo: StickerCellInfo(image: "BodyPositive-Sticker", title: "Body Positive", body: "Seu corpo é lindo do jeito que ele é, lembre-se de sempre falar com você com amor e cuidado"))
                
            
            RightStickerCell(stickerCellInfo: StickerCellInfo(image: "GirlPower-Sticker", title: "Quiz TMI", body: "O resultado do quiz deu: Você é a maior gostosa, nunca se esqueça disso!"))
                
            
            LeftStickerCell(stickerCellInfo: StickerCellInfo(image: "BodyPositive-Sticker", title: "Body Positive", body: "Seu corpo é lindo do jeito que ele é, lembre-se de sempre falar com você com amor e cuidado"))
                
               
            }
        }
    }



struct StickerCellInfo: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var body: String
}

struct WallView_Previews: PreviewProvider {
    static var previews: some View {
        WallView()
    }
}
