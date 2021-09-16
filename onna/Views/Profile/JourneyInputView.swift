//
//  JourneyInputView.swift
//  onna
//
//  Created by Daniella Onishi on 09/09/21.
//

import SwiftUI

struct JourneyInputView: View {
    var journeyInputCell: JourneyInputCell
    
    
    var body: some View {
        
        HStack {
            
            Rectangle()
                .foregroundColor(.onnaBlue)
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(journeyInputCell.title)
                    .onnaFont(OnnaFontSystem.TextStyle.title2)
                    .foregroundColor(.onnaWhite)
                Text(journeyInputCell.bodyText)
                    .onnaFont(OnnaFontSystem.TextStyle.callout)
                    .foregroundColor(.onnaWhite)
            }
        }
    }
}


struct JourneyInputCell: Identifiable {
    var id = UUID()
    var title: String
    var bodyText: String
}

struct JourneyInputView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyInputView(journeyInputCell: JourneyInputCell(title: "Title", bodyText: "Aprenda mais sobre esse assunto"))
    }
}
