//
//  ProgressionSquareView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct ProgressionSquareView: View {
    @State var isActual: Bool
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(self.isActual ? Color.onnaBackgroundBlack : .clear)
                .border(Color.onnaBackgroundBlack, width: 1)
                .frame(width: 52, height: 6, alignment: .center)
                .padding(.top, -20)
        }
        .padding(.top, 10)
    }
}

struct ProgressionSquareView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressionSquareView(isActual: true)
    }
}
