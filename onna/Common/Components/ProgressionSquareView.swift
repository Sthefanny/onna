//
//  ProgressionSquareView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct ProgressionSquareView: View {
    @State var isActual: Bool
    @State var color: Color = .onnaBackgroundBlack
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(self.isActual ? color : .clear)
                .border(color, width: 1)
                .frame(width: 52, height: 6, alignment: .center)
        }
    }
}

struct ProgressionSquareView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressionSquareView(isActual: true)
    }
}
