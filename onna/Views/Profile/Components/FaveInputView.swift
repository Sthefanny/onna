//
//  FaveInputView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 19/09/21.
//

import SwiftUI

struct FaveInputView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var blogViewModel = BlogViewModel()
//    @State private var showingSheet = false
    var content: ContentLiked
    
    var body: some View {
        
        HStack {
            Image(content.image)
                .resizable()
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                .frame(width: 60, height: 60)
                .foregroundColor(.onnaBlue)
                .padding(5)
            
            VStack(alignment: .leading) {
                Text(content.text)
                    .onnaFont(.callout)
                    .foregroundColor(.onnaWhite)
                    .frame(width: 250, height: 40, alignment: .leading)
            }
            .padding(.leading)
        }
        .onTapGesture(count: 1, perform: {
            let dynamicResult = DynamicResult(id: nil, journeyId: content.journeyId, entityId: content.entityId, entityName: content.entityName)
            viewRouter.previousPage = .profileView
            
            switch content.entityName {
            case EntityNameEnum.blog.name:
                blogViewModel.getBlog(id: content.entityId, callback: { isSuccess in
                    if (isSuccess) {
                        viewRouter.parameter = dynamicResult
                        viewRouter.currentPage = getContentType(value: blogViewModel.blog!.page)
                    }
                })
            case EntityNameEnum.challenge.name:
                viewRouter.parameter = content.entityId
                viewRouter.parameter2 = dynamicResult
                viewRouter.currentPage = .challengeView
            case EntityNameEnum.quiz.name:
                viewRouter.parameter = content.entityId
                viewRouter.parameter2 = dynamicResult
                viewRouter.currentPage = .quizView
            default:
                return
            }
//            showingSheet.toggle()
        })
//        .sheet(isPresented: $showingSheet) {
//            JorneyMapView(journeyId: content.journeyId)
//        }
    }
}

struct FaveInputView_Previews: PreviewProvider {
    static var previews: some View {
        FaveInputView(content: ContentLiked(journeyId: 1, entityId: 1, entityName: "Teste", image: "", text: "lalalal la lala"))
    }
}
