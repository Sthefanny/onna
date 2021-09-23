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
    @ObservedObject var viewModel = JourneyViewModel()
    @ObservedObject var userViewModel = UserViewModel()
    var width = UIScreen.main.bounds.width
    @State var fullName = ""
    @State var age: Int?
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    var body: some View {
        ZStack {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            VStack {
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
                .padding(.top, 10)
                
                if (userViewModel.user == nil) {
                    LoadingView()
                } else {
                    VStack {
                        Button(action: {
                            viewRouter.previousPage = .profileView
                            viewRouter.currentPage = .profileConfigView
                        }, label: {
                            Image(userViewModel.user?.image ?? "")
                                .resizable()
                                .clipShape(Circle(), style: FillStyle())
                                .frame(width: 100, height: 100, alignment: .center)
                        })
                        Text("\(fullName)")
                            .onnaFont(OnnaFontSystem.TextStyle.subheadline)
                            .foregroundColor(.white)
                        HStack {
                            Text("\(age ?? 0) anos")
                                .onnaFont(OnnaFontSystem.TextStyle.body)
                                .foregroundColor(.white)
                                .padding(.trailing, 20)
                            Text("•")
                                .onnaFont(OnnaFontSystem.TextStyle.body)
                                .foregroundColor(.white)
                                .padding(.trailing, 20)
                            Link("@\(userViewModel.user?.insta ?? "")", destination: URL(string: "https://www.instagram.com/\(userViewModel.user?.insta ?? "")")!)
                                .onnaFont(OnnaFontSystem.TextStyle.body)
                                .foregroundColor(.white)
    //                        Text("@\(userViewModel.user?.insta ?? "")")
    //                            .onnaFont(OnnaFontSystem.TextStyle.body)
    //                            .foregroundColor(.white)
                        }.padding()
                        
                        VStack(alignment: .center) {
                            Text("\(userViewModel.user?.phrase ?? "")")
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
                            _buildViewSlider
                        }
                    }
                }
                Spacer()
                BottomProgressionSquareView(actualSquare: 2, maxSquare: 3)
            }
        }
        .onAppear {
            let hasViewedTutorial = UserDefaults.standard.bool(forKey: UserDefaultsKeys.hasViewedTutorialJourney.name)
            if (hasViewedTutorial == false) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.viewControllerHolder?.present(style: .overCurrentContext, transitionStyle: .crossDissolve) {
                        TutorialJourneySheetView()
                    }
                }
            }
            
            viewModel.fetchJourney { hasJorney in
                if (!hasJorney){
                    viewRouter.currentPage = .loginView
                }
            }
            viewModel.fetchCompletedJourneys{ _ in }
            
            userViewModel.getUserInfo { isSuccess in
                if (isSuccess) {
                    fullName = "\(userViewModel.user?.firstName ?? "") \(userViewModel.user?.lastName ?? "")"
                    let birthDateString = userViewModel.user?.birthDate
                    let dateFormatter = DateFormatter()
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                    dateFormatter.dateFormat = "dd/MM/yyyy"
                    let birthday = dateFormatter.date(from:birthDateString!)!
                    let now = Date()
                    let calendar = Calendar.current

                    let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
                    age = ageComponents.year
                }
            }
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                .onEnded { _ in
                    if self.offset.width > 0 {
                        withAnimation {
                            viewRouter.previousPage = .profileView
                            viewRouter.currentPage = .homeView
                        }
                    }
                }
        )
    }
    
    var _buildViewSlider: some View{
        
        VStack(spacing: 0){
            
            _buildTabBar
            
            GeometryReader{g in
                
                HStack(spacing: 0){
                    
                    switch actualView {
                    case .journey:
                        InputRow(viewModel: viewModel)
                            .frame(width: width)
                        
                    case .wall:
                        WallView(viewModel: viewModel)
                            .frame(width: width)
                        
                    case .faves:
                        FavesView(viewModel: viewModel)
                            .frame(width: width)
                    }
                }
            }
        }
        .animation(.default)
        .edgesIgnoringSafeArea(.all)
    }
    
    var _buildTabBar: some View {
        VStack(alignment: .leading, content: {
            HStack{
                _buildActiveBar(text: "Jornada", tab: .journey)
                _buildActiveBar(text: "Mural", tab: .wall)
                _buildActiveBar(text: "Faves", tab: .faves)
            }
        })
        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top) ?? 0 + 15)
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
    
    func _buildActiveBar(text: String, tab: WhichView) -> some View {
        Button(action: {
            actualView = tab
        }) {
            VStack(spacing: 8){
                
                HStack(spacing: 12){
                    Text(text)
                        .foregroundColor( actualView == tab ? .onnaBlue : Color.onnaBlue.opacity(0.4))
                }
                
                Capsule()
                    .fill(actualView == tab ? Color.onnaBlue : Color.clear)
                    .frame(width: 70, height: 4)
            }
        }
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
