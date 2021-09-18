//
//  JourneyInputView.swift
//  onna
//
//  Created by Daniella Onishi on 09/09/21.
//

import SwiftUI

struct JourneyInputView: View {
    @State private var showingSheet = false
    var journeyInputCell: Journey
    
    var body: some View {
        
        HStack {
            
            Rectangle()
                .foregroundColor(.onnaBlue)
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(journeyInputCell.title)
                    .onnaFont(.title2)
                    .foregroundColor(.onnaWhite)
                Text(journeyInputCell.description)
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
            JorneyMapView(journey: journeyInputCell)
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
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            let journey = Journey(id: 0, image: "", title: "Title", description: "Tudo o que acontece com o seu corpo durante a menstruação", challenge: nil, blog: nil, quiz: nil, dynamicResults: nil)
            JourneyInputView(journeyInputCell: journey)
        }
    }
}
