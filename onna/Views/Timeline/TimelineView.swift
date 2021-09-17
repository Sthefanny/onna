//
//  TimelineView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 08/09/21.
//

import SwiftUI

struct TimelineView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var viewModel = JourneyViewModel()
    @State private var offset = CGSize.zero
    @State var textInput = ""
    let screenWidth = UIScreen.main.bounds.size.width
    @State var message = ""
    @State var actualView: ShowView = .recents
    
    var body: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Image("Star")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                    Text("Timeline")
                        .onnaFont(OnnaFontSystem .TextStyle.title1)
                        .foregroundColor(.white)
                    Image("Star")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                }
                
                VStack {
                    _buildTextField
                    _buildTextBox
                    
                }
                
                VStack {
                    
                    SegmentedView(actualView: $actualView)
                    
                }
                Spacer()
                BottomProgressionSquareView(actualSquare: 0, maxSquare: 3)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                
                .onEnded { _ in
                    if self.offset.width < 0 {
                        withAnimation {
                            viewRouter.previousPage = .timelineView
                            viewRouter.currentPage = .homeView
                        }
                    }
                }
        )
    }
    var _buildTextField: some View {
        ZStack {
            Rectangle()
                .frame(width: 344, height: 44, alignment: .center)
                .foregroundColor(Color("greyBoxes"))
                .cornerRadius(100)
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding(.leading, 30)
                    .foregroundColor(.onnaWhite)
                TextField("Perguntas, dúvidas e depoimentos", text: $textInput)
                    .foregroundColor(.white)
            }.padding(20)
        }
    }
    
    var _buildTextBox: some View {
        
        ZStack {
            TextField("Escreva aqui o que te aflinge...", text: $message)
                .onnaFont(.callout)
                .foregroundColor(.onnaMainGrey)
                .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                .frame(width: 350, height: 120, alignment: .topLeading)
                .background(RoundedRectangle(cornerRadius: 13))
                .foregroundColor(.onnaGreyBoxes)
                .multilineTextAlignment(.leading)
            
            
            Button(action: {
                print("Clicked")
            }) {
                Image("Send-Message")
                    .padding(.leading, 280)
                    .padding(.top, 60)
            }
        }
    }
}


struct SegmentedView : View {
    var width = UIScreen.main.bounds.width
    @Binding var actualView: ShowView
    
    var body: some View{
        
        VStack(spacing: 0){
            
            AppBar2(actualView: $actualView)
            
            GeometryReader{g in
                
                HStack(spacing: 0){
                    
                    switch actualView {
                    case .recents:
                        Recents(recentsInfo: RecentsInfo(profilePic: "Woman-1", userComment: "Text Text"))
                            .frame(width: g.frame(in : .global).width)
                           
                    case .yours:
                        Yours()
                            .frame(width: g.frame(in : .global).width)
                           
                    case .yays:
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

struct AppBar2 : View {
    var width = UIScreen.main.bounds.width
    @Binding var actualView: ShowView
    
    var body: some View{
        
        VStack(alignment: .leading, content: {
            
            HStack{
                
                Button(action: {
                    actualView = .recents
                }) {
                    
                    VStack(spacing: 8){
                        
                        HStack(spacing: 12){
                            Text("Recentes")
                                .foregroundColor( actualView == .recents ? .onnaBlue : Color.onnaBlue.opacity(0.4))
                        }
                        
                        Capsule()
                            .fill(actualView == .recents ? Color.onnaBlue : Color.clear)
                            .frame(width: 70, height: 4)
                    }
                }
                
                Button(action: {
                    actualView = .yours
                    
                }) {
                    
                    VStack(spacing: 8){
                        
                        HStack(spacing: 12){
                            Text("Seus")
                                .foregroundColor(actualView == .yours ? .onnaBlue : Color.onnaBlue.opacity(0.4))
                        }
                        
                        Capsule()
                            .fill(actualView == .yours ? Color.onnaBlue : Color.clear)
                            .frame(width: 70, height: 4)
                    }
                }
                
                Button(action: {
                    actualView = .yays
                    
                }) {
                    
                    VStack(spacing: 8){
                        
                        HStack(spacing: 12){
                            Text("Yays")
                                .foregroundColor(actualView == .yays ? .onnaBlue : Color.onnaBlue.opacity(0.4))
                        }
                        
                        Capsule()
                            .fill(actualView == .yays ? Color.onnaBlue : Color.clear)
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

enum ShowView {
    case recents
    case yours
    case yays
}



struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
