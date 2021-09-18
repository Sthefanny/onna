//
//  ProfileView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 08/09/21.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var offset = CGSize.zero
    let screenWidth = UIScreen.main.bounds.size.width
    @State var actualView: WhichView = .journey

    var body: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView {
                    HStack {
                        Image("Star")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                        Text("Perfil")
                            .onnaFont(OnnaFontSystem .TextStyle.title1)
                            .foregroundColor(.white)
                        Image("Star")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                    }
                    
                    VStack {
                        Image("Profile-Pic-4")
                            .resizable()
                            .clipShape(Circle(), style: FillStyle())
                            .frame(width: 100, height: 100, alignment: .center)
                        Text("Malu Gonzatta")
                            .onnaFont(OnnaFontSystem.TextStyle.subheadline)
                            .foregroundColor(.white)
                        HStack {
                            Text("idade")
                                .onnaFont(OnnaFontSystem.TextStyle.body)
                                .foregroundColor(.white)
                                .padding(.trailing, 20)
                            Text("•")
                                .onnaFont(OnnaFontSystem.TextStyle.body)
                                .foregroundColor(.white)
                                .padding(.trailing, 20)
                            Text("insta")
                                .onnaFont(OnnaFontSystem.TextStyle.body)
                                .foregroundColor(.white)
                        }.padding()
                        
                        VStack(alignment: .center) {
                            Text("falo besteira e amo \nconversar sobre ppk")
                                .onnaFont(OnnaFontSystem.TextStyle.body)
                                .foregroundColor(.white)
                        }
                        .frame(width: 250, height: 70, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 20))
                        .foregroundColor(.onnaMainGrey.opacity(0.4))
                        .padding()
                        
                        HStack {
                            
                        }.frame(width: screenWidth.magnitude, height: 2, alignment: .center)
                        
                        VStack {
                            ViewSlider(actualView: $actualView)
                        }
                    }
                }
            }
        }
    }
}

struct ViewSlider : View {
    
    @Binding var actualView: WhichView
    var width = UIScreen.main.bounds.width
    
    var body: some View{
        
        VStack(spacing: 0){
            
            AppBar(actualView: $actualView)
            
            GeometryReader{g in
                
                HStack(spacing: 0){
                    
                    switch actualView {
                    case .journey:
                        InputRow()
                            .frame(width: width)
                           
                    case .wall:
                        WallView()
                            .frame(width: width)
                           
                    case .faves:
                        Yays()
                            .frame(width: g.frame(in : .global).width)
                    }
                }
            }
        }
        .animation(.default)
        .edgesIgnoringSafeArea(.all)
    }
}

struct AppBar : View {
    
    @Binding var actualView: WhichView
    var width = UIScreen.main.bounds.width
    
    var body: some View{
        
        VStack(alignment: .leading, content: {
            HStack{
                
                Button(action: {
                    actualView = .journey
                }) {
                    
                    VStack(spacing: 8){
                        
                        HStack(spacing: 12){
                            
                            
                            Text("Jornada")
                                .foregroundColor(actualView == .journey ? .onnaBlue : Color.onnaBlue.opacity(0.4)) .onnaFont(OnnaFontSystem.TextStyle.subheadline)
                        }
                        Capsule()
                            .fill(actualView == .journey ? Color.onnaBlue : Color.clear)
                            .frame(width: 70, height: 4)
                    }
                }
                
                Button(action: {
                    actualView = .wall
                }) {
                    
                    VStack(spacing: 8){
                        HStack(spacing: 12){
                            Text("Mural")
                                .foregroundColor(actualView == .wall ? .onnaBlue : Color.onnaBlue.opacity(0.4))
                                .onnaFont(OnnaFontSystem.TextStyle.subheadline)
                        }
                        
                        Capsule()
                            .fill(actualView == .wall ? Color.onnaBlue : Color.clear)
                            .frame(width: 70, height: 4)
                    }
                }
                
                Button(action: {
                    actualView = .faves
                }) {
                    
                    VStack(spacing: 8){
                        HStack(spacing: 12){
                            Text("Faves")
                                .foregroundColor(actualView == .faves ? .onnaBlue : Color.onnaBlue.opacity(0.4))
                                .onnaFont(OnnaFontSystem.TextStyle.subheadline)
                        }
                        
                        Capsule()
                            .fill(actualView == .faves ? Color.onnaBlue : Color.clear)
                            .frame(width: 70, height: 4)
                    }
                }
            }
        })
        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top) ?? 0 + 15)
        .padding(.horizontal)
        .padding(.bottom, 10)
        
    }
}

enum WhichView {
    case journey
    case wall
    case faves
}





struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
