//
//  LoadingView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 18/09/21.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        Image("Onna-Logo")
            .aspectRatio(1, contentMode: .fit)
            .padding(20)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
