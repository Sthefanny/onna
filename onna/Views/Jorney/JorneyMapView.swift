
import SwiftUI

struct JorneyMapView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var viewModel = JourneyViewModel()
    @State var journeyId: Int
    @State var bgImage: String?
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            Image(bgImage ?? "Journey-0-bg")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            
            if (viewModel.journeyWithContent == nil) {
                LoadingView()
            } else {
                VStack {
                    _buildTitleAndDescription
                    _buildChallenge
                    _buildQuiz
                    _buildBlog
                }
            }
            
        }
        .onAppear {
            viewModel.getJourneyById(journeyId: journeyId) { isSuccess in
                if(isSuccess) {
                    let challengeCompleteded = viewModel.journeyWithContent?.challenge?.completed == true
                    let blogCompleteded = viewModel.journeyWithContent?.blog?.completed == true
                    let quizCompleteded = viewModel.journeyWithContent?.quiz?.completed == true
                    if(challengeCompleteded && blogCompleteded && quizCompleteded) {
                        bgImage = "Journey-3-bg"
                    } else if (challengeCompleteded) {
                        bgImage = "Journey-1-bg"
                    } else if (blogCompleteded) {
                        bgImage = "Journey-2-bg"
                    } else if (quizCompleteded) {
                        bgImage = "Journey-3-bg"
                    }
                }
            }
        }
    }
    var _buildTitleAndDescription: some View {
        VStack(alignment: .leading) {
            Text(viewModel.journeyWithContent!.title)
                .onnaFont(.title2, textSize: 20)
                .foregroundColor(.onnaBackgroundBlack)
                .multilineTextAlignment(.leading)
            
            Text(viewModel.journeyWithContent!.description)
                .onnaFont(.body)
                .foregroundColor(.onnaBackgroundBlack)
                .multilineTextAlignment(.leading)
                .padding(.top, 5)
        }
        .frame(width: 300, height: 200, alignment: .leading)
    }
    
    var  _buildChallenge: some View {
        HStack {
            _buildButtom(text: "1", color: .onnaGreen, pageType: .challenge, entityId: viewModel.journeyWithContent!.challenge!.id)
            
            Text("Challenge: \(viewModel.journeyWithContent!.challenge!.title)")
                .onnaFont(.body, textSize: 15)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 210, height: 90, alignment: .center)
                .multilineTextAlignment(.leading)
        }
        .offset(x: 20, y: 115)
        
    }
    
    var  _buildQuiz: some View {
        HStack {
            Text("Blog: \(viewModel.journeyWithContent!.blog!.title)")
                .onnaFont(.body, textSize: 15)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 210, height: 90, alignment: .center)
                .multilineTextAlignment(.trailing)
            
            _buildButtom(text: "2", color: .onnaYellow, pageType: .blog, entityId: viewModel.journeyWithContent!.blog!.id)
        }
        .offset(x: -40, y: 135)
    }
    
    
    var  _buildBlog: some View {
        HStack {
            _buildButtom(text: "3", color: .onnaPink, pageType: .quiz, entityId: viewModel.journeyWithContent!.quiz!.id)
            
            Text("Quiz: \(viewModel.journeyWithContent!.quiz!.title)")
                .onnaFont(.body, textSize: 15)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 170, height: 90, alignment: .center)
                .multilineTextAlignment(.leading)
        }
        .offset(x: -30, y: 150)
        
    }
    func _buildButtom(text: String, color: Color, pageType: EntityNameEnum, entityId: Int) -> some View {
        Button(action: {
            let dynamicResult = DynamicResult(id: nil, journeyId: viewModel.journeyWithContent!.id, entityId: entityId, entityName: EntityNameEnum.blog.name)
            viewRouter.previousPage = .profileView
            
            switch pageType {
            case .blog:
                viewRouter.parameter = dynamicResult
                viewRouter.currentPage = getContentType(value: viewModel.journeyWithContent!.blog!.page)
            case .challenge:
                viewRouter.parameter = entityId
                viewRouter.parameter2 = dynamicResult
                viewRouter.currentPage = .challengeView
            case .quiz:
                viewRouter.parameter = entityId
                viewRouter.parameter2 = dynamicResult
                viewRouter.currentPage = .quizView
            }
            
        }, label: {
            ZStack {
                Ellipse()
                    .frame(width: 65, height: 65)
                    .foregroundColor(color)
                    .padding(5)
                    .shadow(radius: 4, x: 0, y: 4)
                
                Text(text)
                    .onnaFont(.largeTitle)
                    .foregroundColor(.onnaBackgroundBlack)
                    .multilineTextAlignment(.center)
                    .frame(width: 65, height: 65, alignment: .center)
            }
        })
    }
}

struct JorneyMapView_Previews: PreviewProvider {
    static var previews: some View {
        JorneyMapView(journeyId: 1)
    }
}

