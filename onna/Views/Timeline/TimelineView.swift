//
//  TimelineView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 08/09/21.
//

import SwiftUI

struct TimelineView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var offset = CGSize.zero
    @State var textInput = ""
    let screenWidth = UIScreen.main.bounds.size.width
    @State var message = ""
    @State var actualView: ShowView = .recents
    @ObservedObject var viewModel = PostViewModel()
    
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
                .padding(.top, 10)
                
                VStack {
                    _buildTextField
                    
                    TextEditorPostView(callback: {isSuccess in
                        if(isSuccess) {
                            viewModel.fetchPosts(callback: { isSuccess in })
                            viewModel.fetchYourPosts(callback: { isSuccess in })
                        }
                    })
                }
                
                VStack {
                    _buildSegmentedView
                }
                Spacer()
                BottomProgressionSquareView(actualSquare: 0, maxSquare: 3)
            }
        }
        .onAppear{
            viewModel.fetchPosts(callback: { isSuccess in
                viewModel.filterLikedPosts()
            })
            viewModel.fetchYourPosts(callback: { isSuccess in })
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
        .onTapGesture {
            self.hideKeyboard()
        }
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
                    .onChange(of: textInput, perform: { value in
                        viewModel.filterPosts(filter: value)
                    })
            }.padding(20)
        }
    }
    
    var _buildSegmentedView: some View{
        
        VStack(spacing: 0){
            
            _buildTabBar
            
            GeometryReader{ g in
                HStack(spacing: 0){
                    switch actualView {
                    case .recents:
                        VStack {
                            if (viewModel.posts.count == 0 && viewModel.filteredPosts.count == 0) {
                                Text("Ainda não tem nada publicado nos chats, crie uma nova pergunta ou conversa para interagir com as outras pessoas.")
                                    .onnaFont(.body)
                                    .foregroundColor(.onnaMainGrey)
                                    .padding(60)
                            } else {
                                let postsToShow = viewModel.filteredPosts.count == 0 ? viewModel.posts.reversed() : viewModel.filteredPosts.reversed()
                                ScrollView {
                                    ForEach(postsToShow) { post in
                                        Button(action: {
                                            viewRouter.parameter = post.id
                                            viewRouter.previousPage = .timelineView
                                            viewRouter.currentPage = .chatView
                                        }, label: {
                                            Recents(post: post)
                                                .frame(width: g.frame(in : .global).width)
                                        })
                                    }
                                }
                            }
                        }
                        .padding(.top, 20)
                        
                    case .yours:
                        VStack {
                            if (viewModel.userPosts.count == 0 && viewModel.filteredPosts.count == 0) {
                                Text("Ainda não tem nada publicado nos chats, crie uma nova pergunta ou conversa para interagir com as outras pessoas.")
                                    .onnaFont(.body)
                                    .foregroundColor(.onnaMainGrey)
                                    .padding(60)
                            } else {
                                let postsToShow = viewModel.filteredUserPosts.count == 0 ? viewModel.userPosts.reversed() : viewModel.filteredPosts.reversed()
                                ScrollView {
                                    ForEach(postsToShow) { post in
                                        Button(action: {
                                            viewRouter.parameter = post.id
                                            viewRouter.previousPage = .timelineView
                                            viewRouter.currentPage = .chatView
                                        }, label: {
                                            Recents(post: post)
                                                .frame(width: g.frame(in : .global).width)
                                        })
                                    }
                                }
                            }
                        }
                        .padding(.top, 20)
                        
                    case .yays:
                        VStack {
                            if (viewModel.likedPosts.count == 0) {
                                Text("Você ainda não tem deu yay em nenhuma publicação.")
                                    .onnaFont(.body)
                                    .foregroundColor(.onnaMainGrey)
                                    .padding(60)
                            } else {
                                ScrollView {
                                    ForEach(viewModel.likedPosts.reversed()) { post in
                                        Button(action: {
                                            viewRouter.parameter = post.id
                                            viewRouter.previousPage = .timelineView
                                            viewRouter.currentPage = .chatView
                                        }, label: {
                                            Recents(post: post)
                                                .frame(width: g.frame(in : .global).width)
                                        })
                                    }
                                }
                            }
                        }
                        .padding(.top, 20)
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
                _buildActiveBar(text: "Recentes", tab: .recents)
                _buildActiveBar(text: "Seus", tab: .yours)
                _buildActiveBar(text: "Yays", tab: .yays)
            }
        })
        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top) ?? 0 + 15)
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
    
    func _buildActiveBar(text: String, tab: ShowView) -> some View {
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
