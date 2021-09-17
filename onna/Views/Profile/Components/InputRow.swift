//
//  InputRow.swift
//  onna
//
//  Created by Daniella Onishi on 14/09/21.
//

import SwiftUI

struct InputRow: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var viewModel: JourneyViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.journey, id: \.id) { journey in
                JourneyInputView(journeyInputCell:journey)
            }
        }
        .padding(.horizontal, 50)
        .padding(.top, 20)
        .onAppear {
            viewModel.fetchJourney{ hasJorney in
                if (!hasJorney){
                    viewRouter.currentPage = .loginView
                }
            }
        }
    }
}

//struct InputRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
//            InputRow()
//        }
//    }
//}
