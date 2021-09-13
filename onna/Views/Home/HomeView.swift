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
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            VStack {
                _buildStories
                _buildTextField
                _buildTodayJourney
                _buildFirstContentLine
                _buildLatestTimeline
                _buildSecondContentLine
                
            }
        }
        .onAppear {
            print("TESTES")
            viewModel.fetchJourney()
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }

                .onEnded { _ in
                    if self.offset.width < 0 {
                        print("Direita: Entrou no onEnded 1 com \(self.offset.width) e com \(screenWidth)")
                        withAnimation {
                            viewRouter.previousPage = .homeView
                            viewRouter.currentPage = .profileView
                        }
                    } else {
                        self.offset = .zero
                        print("Esquerda: Entrou no onEnded 2 com \(self.offset.width) e com \(screenWidth)")
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
                    .padding(10)
            }
        }
    }
    
    var _buildTextField: some View {
        ZStack {
            Rectangle()
                .frame(width: 344, height: 44, alignment: .center)
                .foregroundColor(Color("greyBoxes"))
                .cornerRadius(100)
            HStack {
                Image("Baloon-With-Star")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.leading, 30)
                TextField("O que te aflinge", text: $textInput)
                    .foregroundColor(.white)
            }.padding(20)
            
        }
    }
    
    var _buildTodayJourney: some View {
        HStack {
            let jorney = viewModel.journey.first
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
                .cornerRadius(8)
            Spacer()
            VStack(alignment: .leading) {
                Text(jorney?.title ?? "")
                    .foregroundColor(.white)
                    .font(.title2)
                Text(jorney?.description ?? "")
                    .foregroundColor(.white)
                    .font(.caption2)
            }
            Spacer()
        }
        .padding()
        .frame(width: 335, height: 120, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 20))
        .foregroundColor(.onnaGreyBoxes)
    }
    
    var _buildFirstContentLine: some View {
        HStack {
            Image("GirlPower-Home")
                .resizable()
                .frame(width: 150, height: 140)
                .padding(8)
            Image("BodyPositive-Home")
                .resizable()
                .frame(width: 150, height: 140)
                .padding(8)
        }
    }
    
    var _buildLatestTimeline: some View {
        ZStack {
            Rectangle()
                .frame(width: 335, height: 120, alignment: .center)
                .cornerRadius(20)
                .foregroundColor(Color("greyBoxes"))
            HStack {
                Image("Dani")
                    .resizable()
                    .frame(width: 60, height: 75)
                    .clipShape(Circle(), style: FillStyle())
                    .padding(.trailing, 40)
                VStack(alignment: .leading) {
                    Text("Juliana Gomez")
                        .foregroundColor(.white)
                        .font(.title2)
                    Text("Essa menstruação veio \nacabando com a minha vida 😭")
                        .foregroundColor(.white)
                        .font(.caption)
                }
            }
        }
    }
    
    var _buildSecondContentLine: some View {
        HStack {
            Image("Feminism-Home")
                .resizable()
                .frame(width: 150, height: 130)
                .padding(8)
            Image("Period-Home")
                .resizable()
                .frame(width: 150, height: 130)
                .padding(8)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
