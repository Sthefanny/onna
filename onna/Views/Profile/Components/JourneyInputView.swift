//
//  JourneyInputView.swift
//  onna
//
//  Created by Daniella Onishi on 09/09/21.
//

import SwiftUI

struct JourneyInputView: View {
    @State private var showingSheet = false
    var journey: Journey
    
    var body: some View {
        
        HStack {
            Image(getRandomJourneyImage())
                .resizable()
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                .frame(width: 60, height: 60)
                .foregroundColor(.onnaBlue)
                .padding(5)
            
            VStack(alignment: .leading) {
                Text(journey.title)
                    .onnaFont(.title2)
                    .foregroundColor(.onnaWhite)
                Text(journey.description)
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
            JorneyMapView(journeyId: journey.id)
        }
    }
}



func getRandomJourneyImage() -> String {
    let randomNum = Int.random(in: 1..<6)
    return "journey-icon-\(randomNum)"
}

struct JourneyInputView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            let journey = Journey(id: 0, image: "", title: "Title", description: "Tudo o que acontece com o seu corpo durante a menstruação", challenge: nil, blog: nil, quiz: nil, dynamicResults: nil)
            JourneyInputView(journey: journey)
        }
    }
}
