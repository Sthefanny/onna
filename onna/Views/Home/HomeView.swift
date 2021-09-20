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
    @ObservedObject var postsViewModel = PostViewModel()
    
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
            
            if (viewModel.journey.count > 0) {
                VStack {
                    _buildStories
                    _buildTodayJourneyAndTimeline
                    _buildBlogCard
                    _buildQuizCard
                    _buildChallengeCard
                    Spacer()
                    BottomProgressionSquareView(actualSquare: 1, maxSquare: 3)
                }
            } else {
                LoadingView()
            }
        }
        .onAppear {
            viewModel.fetchJourney{ hasJorney in
                if (!hasJorney){
                    
                    DispatchQueue.main.async {
                        viewRouter.currentPage = .loginView
                    }
                }
            }
            postsViewModel.fetchPosts(callback: {isSuccess in})
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
        .padding(.top, 20)
        .padding(.bottom, 20)
    }
    
    var _buildTodayJourneyAndTimeline: some View {
        VStack (alignment: .leading) {
            Text("Bombando por aí")
                .foregroundColor(.white)
                .onnaFont(.callout)
            HStack {
                _buildTodayJourney
                Button(action: {
                    viewRouter.parameter = postsViewModel.posts.last?.id
                    viewRouter.previousPage = .homeView
                    viewRouter.currentPage = .chatView
                }, label: {
                    _buildTimeline
                })
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
                Image(postsViewModel.posts.last?.userImage ?? "")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle(), style: FillStyle())
                Text(postsViewModel.posts.last?.userName ?? "")
                    .foregroundColor(.white)
                    .onnaFont(.title2)
                    .lineLimit(2)
                    .frame(width: 95, height: 50, alignment: .leading)
            }
            Text(postsViewModel.posts.last?.text ?? "")
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
        let heartQuantity = postsViewModel.posts.last?.likeQuantity ?? 0
        let commentQuantity = postsViewModel.posts.last?.commentQuantity ?? 0
        return  HStack {
            HStack {
                Image(systemName: postsViewModel.posts.last?.hasLiked == true ? "heart.fill": "heart")
                    .font(.system(size: 15))
                    .foregroundColor(.onnaPink)
                    .padding(.trailing, -5)
                Text("\(heartQuantity)")
                    .onnaFont(.callout, textSize: 10)
                    .foregroundColor(.onnaWhite)
            }
            .padding(.trailing, 10)
            HStack {
                Image(systemName: "bubble.left")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                Text("\(commentQuantity)")
                    .onnaFont(.callout, textSize: 10)
                    .foregroundColor(.onnaWhite)
                    .padding(.leading, -5)
            }
        }
        .padding(.top, 5)
    }
    
    var _buildBlogCard: some View {
        let firstBlog = viewModel.journey.first?.blog
        
        return HStack {
            Image(firstBlog?.icon ?? "")
                .resizable()
                .frame(width: 130, height: 110)
                .padding(EdgeInsets(top: 19, leading: 8, bottom: 19, trailing: 8))
            
            Text("Blog: \(firstBlog?.title ?? "")")
                .multilineTextAlignment(.leading)
                .foregroundColor(.onnaBackgroundBlack)
                .onnaFont(.callout)
                .padding(.trailing, 20)
        }
        .frame(width: 350, height: 110, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 20))
        .foregroundColor(getColorByContent(value: .blog))
        .padding(.top, 20)
        .onTapGesture(count: 1, perform: {
            let dynamicResult = DynamicResult(id: nil, journeyId: viewModel.journey.first!.id, entityId: firstBlog!.id, entityName: EntityNameEnum.blog.name)
            viewRouter.previousPage = .homeView
            viewRouter.parameter = dynamicResult
            viewRouter.currentPage = getContentType(value: firstBlog!.page)
        })
    }
    
    var _buildQuizCard: some View {
        let firstQuiz = viewModel.journey.first?.quiz
        
        return HStack {
            Image(firstQuiz?.icon ?? "")
                .resizable()
                .frame(width: 130, height: 110)
                .padding(EdgeInsets(top: 19, leading: 8, bottom: 19, trailing: 8))
            
            Text("Quiz: \(firstQuiz?.title ?? "")")
                .multilineTextAlignment(.leading)
                .foregroundColor(.onnaBackgroundBlack)
                .onnaFont(.callout)
                .padding(.trailing, 20)
        }
        .frame(width: 350, height: 110, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 20))
        .foregroundColor(getColorByContent(value: .quiz))
        .padding(.vertical, 10)
        .onTapGesture(count: 1, perform: {
            viewRouter.parameter = firstQuiz?.id
            viewRouter.previousPage = .homeView
            viewRouter.currentPage = .quizView
        })
    }
    
    var _buildChallengeCard: some View {
        let firstChallenge = viewModel.journey.first?.challenge
        
        return HStack {
            Image(firstChallenge?.icon ?? "")
                .resizable()
                .frame(width: 130, height: 110)
                .padding(EdgeInsets(top: 19, leading: 8, bottom: 19, trailing: 8))
            
            Text("Challenge: \(firstChallenge?.title ?? "")")
                .multilineTextAlignment(.leading)
                .foregroundColor(.onnaBackgroundBlack)
                .onnaFont(.callout)
                .padding(.trailing, 20)
        }
        .frame(width: 350, height: 110, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 20))
        .foregroundColor(getColorByContent(value: .challenge))
        .padding(.bottom, 10)
        .onTapGesture(count: 1, perform: {
            let dynamicResult = DynamicResult(id: nil, journeyId: viewModel.journey.first!.id, entityId: firstChallenge!.id, entityName: EntityNameEnum.challenge.name)
            viewRouter.parameter = firstChallenge?.id
            viewRouter.parameter2 = dynamicResult
            viewRouter.previousPage = .homeView
            viewRouter.currentPage = .challengeView
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
