//
//  Home.swift
//  onna
//
//  Created by Daniella Onishi on 07/09/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var viewModel = JourneyViewModel()
    
    var instaStoryCells: [InstaStoryInfo] = [
        InstaStoryInfo(image: "Story01Icon", text: "Filtros", content: ""),
        InstaStoryInfo(image: "Story02Icon", text: "Corpo", content: ""),
        InstaStoryInfo(image: "Story03Icon", text: "Mestruação", content: ""),
        InstaStoryInfo(image: "Story04Icon", text: "Sexualidade", content: "")
    ]
    
    @State private var offset = CGSize.zero
    @State var textInput = ""
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            VStack {
                _buildStories
                _buildTodayJourneyAndTimeline
                _buildFirstContentLine
                Spacer()
                BottomProgressionSquareView(actualSquare: 1, maxSquare: 3)
            }
        }
        .onAppear {
            //            viewModel.fetchJourney()
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                
                .onEnded { _ in
                    if self.offset.width < 0 {
                        withAnimation {
                            viewRouter.previousPage = .homeView
                            viewRouter.currentPage = .profileView
                        }
                    } else {
                        withAnimation {
                            viewRouter.previousPage = .homeView
                            viewRouter.currentPage = .timelineView
                        }
                    }
                }
        )
    }
    
    var _buildStories: some View {
        HStack {
            ForEach(instaStoryCells, id: \.id) { story in
                StoryCellView(instaStoryInfo:story)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
        }
        .padding(.bottom, 20)
    }
    
    var _buildTodayJourneyAndTimeline: some View {
        VStack (alignment: .leading) {
            Text("Bombando por aí")
                .foregroundColor(.white)
                .onnaFont(.callout)
            HStack {
                _buildTodayJourney
                _buildTimeline
            }
        }
    }
    
    var _buildTodayJourney: some View {
        VStack {
            HStack {
                Rectangle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.yellow)
                    .cornerRadius(8)
                Text("Jornada de hoje")
                    .foregroundColor(.white)
                    .onnaFont(.title2)
            }
            Text("Hoje a tarefa é escrever uma mensagem bonita pra você!")
                .foregroundColor(.white)
                .onnaFont(.callout)
                .padding(.top, 5)
        }
        .padding(10)
        .frame(width: 170, height: 170, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 20))
        .foregroundColor(.onnaGreyBoxes)
    }
    
    var _buildTimeline: some View {
        VStack {
            HStack {
                Image("Profile-Pic-3")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle(), style: FillStyle())
                Text("Juliana Gomez")
                    .foregroundColor(.white)
                    .onnaFont(.title2)
            }
            Text("Essa menstruação veio acabando com a minha vida 😭")
                .foregroundColor(.white)
                .onnaFont(.callout)
                .padding(.top, 5)
            _buildYaysAndComments
        }
        .padding(10)
        .frame(width: 170, height: 170, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 20))
        .foregroundColor(.onnaGreyBoxes)
    }
    
    var _buildYaysAndComments: some View {
        HStack {
            HStack {
                Image(systemName: "heart")
                    .font(.system(size: 15))
                    .foregroundColor(.onnaPink)
                    .padding(.trailing, -5)
                Text("35")
                    .onnaFont(.callout, textSize: 10)
                    .foregroundColor(.onnaWhite)
            }
            .padding(.trailing, 10)
            HStack {
                Image(systemName: "bubble.left")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                Text("35")
                    .onnaFont(.callout, textSize: 10)
                    .foregroundColor(.onnaWhite)
                    .padding(.leading, -5)
            }
        }
        .padding(.top, 5)
    }
    
    var _buildFirstContentLine: some View {
        HStack {
            Image("GirlPowerIcon")
                .resizable()
                .frame(width: 130, height: 110)
                .padding(EdgeInsets(top: 19, leading: 8, bottom: 19, trailing: 8))
            
            Text("Blog: Aprenda sobre o empoderamento do corpo ")
                .multilineTextAlignment(.leading)
                .foregroundColor(.onnaBackgroundBlack)
                .onnaFont(.callout)
                .padding(.trailing, 20)
        }
        .frame(width: 350, height: 110, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 20))
        .foregroundColor(.onnaGreen)
        .padding(.vertical, 20)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
