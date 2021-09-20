//
//  FavesView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 19/09/21.
//

import SwiftUI
import SwiftUI

struct FavesView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var viewModel: JourneyViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if (viewModel.favesJourney.count == 0) {
                Text("Você ainda não favoritou nenhum conteúdo.")
                    .onnaFont(.body)
                    .foregroundColor(.onnaMainGrey)
                    .frame(width: 300, height: 50, alignment: .top)
                    .padding(30)
            } else {
                ScrollView {
                    ForEach(0 ..< viewModel.favesJourney.count) { i in
                        FaveInputView(journey: viewModel.favesJourney[i])
                    }
                }
            }
        }
        .padding(.horizontal, 50)
        .padding(.top, 20)
        .onAppear {
            viewModel.fetchFavoritesJourneys{ _ in}
        }
    }
}

struct FavesView_Previews: PreviewProvider {
    static var previews: some View {
        FavesView(viewModel: JourneyViewModel())
    }
}
