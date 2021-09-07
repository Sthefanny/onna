//
//  Home.swift
//  onna
//
//  Created by Daniella Onishi on 07/09/21.
//

import SwiftUI

struct Home: View {
    var instaStoryCells: [InstaStoryInfo] = [
        InstaStoryInfo(image: "Bru", text: "Menstruar", content: ""),
        InstaStoryInfo(image: "Deh", text: "Filtros", content: ""),
        InstaStoryInfo(image: "Jess", text: "Gravidez", content: ""),
        InstaStoryInfo(image: "Sthe", text: "Corpo", content: "")
    ]
    
    var body: some View {
        ZStack {
            Color("backgroundBlack")
                .ignoresSafeArea()
            VStack {
                HStack {
                    ForEach(instaStoryCells, id: \.id) { story in
                        StoryCellView(instaStoryInfo:story)
                            .padding(10)
                    }
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: 344, height: 44, alignment: .center)
                        .foregroundColor(Color("greyBoxes"))
                        .cornerRadius(100)
                    HStack {
                        Image("Baloon-With-Star")
                            .resizable()
                            .frame(width: 25, height: 25)
                        TextField("O que te aflinge", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                    }.padding(55)
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: 335, height: 120, alignment: .center)
                        .cornerRadius(20)
                        .foregroundColor(Color("greyBoxes"))
                    HStack {
                        Rectangle()
                            .frame(width: 50, height: 50, alignment: .leading)
                            .foregroundColor(.yellow)
                            .cornerRadius(8)
                            .padding()
                        VStack {
                            Text("Jornada de Hoje")
                                .foregroundColor(.white)
                                .font(.title)
                            Text("Lorem ipsum sit dor nao \nlembro o resto")
                                .foregroundColor(.white)
                                .font(.body)
                        }
                        
                    }
                }
                HStack {
                    Image("GirlPower-Home")
                        .resizable()
                        .frame(width: 130, height: 130)
                        .padding()
                    Image("BodyPositive-Home")
                        .resizable()
                        .frame(width: 130, height: 130)
                }
                
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
                            .padding()
                        VStack(alignment: .leading) {
                            Text("Juliana Gomez")
                                .foregroundColor(.white)
                                .font(.title)
                            Text("Essa menstruação veio \nacabando com a minha vida 😭")
                                .foregroundColor(.white)
                                .font(.body)
                        }
                    }
                    
                }
                
                HStack {
                    Image("Feminism-Home")
                        .resizable()
                        .frame(width: 130, height: 130)
                        .padding()
                    Image("Period-Home")
                        .resizable()
                        .frame(width: 130, height: 130)
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
