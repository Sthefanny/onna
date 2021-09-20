//
//  FaveInputView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 19/09/21.
//

import SwiftUI

struct FaveInputView: View {
    @State private var showingSheet = false
    var journey: ContentLiked
    
    var body: some View {
        
        HStack {
            Image(journey.image)
                .resizable()
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                .frame(width: 60, height: 60)
                .foregroundColor(.onnaBlue)
                .padding(5)
            
            VStack(alignment: .leading) {
                Text(journey.text)
                    .onnaFont(.callout)
                    .foregroundColor(.onnaWhite)
                    .frame(width: 250, height: 40, alignment: .leading)
            }
            .padding(.leading)
        }
        .onTapGesture(count: 1, perform: {
            showingSheet.toggle()
        })
        .sheet(isPresented: $showingSheet) {
            JorneyMapView(journeyId: journey.journeyId)
        }
    }
}

struct FaveInputView_Previews: PreviewProvider {
    static var previews: some View {
        FaveInputView(journey: ContentLiked(journeyId: 1, entityId: 1, entityName: "Teste", image: "", text: "lalalal la lala"))
    }
}
