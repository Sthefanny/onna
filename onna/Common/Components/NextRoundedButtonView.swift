//
//  NextRoundButton.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI

struct NextRoundedButtonView: View {
    @State var action: () -> Void
    
    var body: some View {
        Button(action: self.action, label: {
            Image(systemName: "chevron.right")
                .font(.system(size: 22))
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 12, height: 12, alignment: .center)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                )
        })
    }
}

struct NextRoundedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NextRoundedButtonView(action: {})
    }
}
