//
//  InputRow.swift
//  onna
//
//  Created by Daniella Onishi on 14/09/21.
//

import SwiftUI

struct InputRow: View {
    var cellsContent = [ JourneyInputCell(title: "Menstruação", bodyText: "aprenda mais sobre ciclos mestruais"),
                         JourneyInputCell(title: "Corpo", bodyText: "aprenda mais sobre o seu corpo"),
                         JourneyInputCell(title: "Sexualidade", bodyText: "aprenda mais sobre a sua sexualidade"),
                         JourneyInputCell(title: "Gravidez", bodyText: "Como ocorre uma gravidez? O que fazer e como previnir?"),
                         JourneyInputCell(title: "DSTs", bodyText: "Como previnir o contato com DSTs?"),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(cellsContent, id: \.id) { story in
                JourneyInputView(journeyInputCell:story)
            }
        }
    }
}

struct InputRow_Previews: PreviewProvider {
    static var previews: some View {
        InputRow()
    }
}
