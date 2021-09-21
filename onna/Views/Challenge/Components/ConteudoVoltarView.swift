//
//  ConteudoVoltarView.swift
//  onna
//
//  Created by Jessica Akemi Meguro on 10/09/21.
//

import SwiftUI

struct ConteudoVoltarView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    let conteudoName: String
    var dynamicResult: DynamicResult
    @ObservedObject var viewModel = DynamicResultViewModel()
    @ObservedObject var journeyViewModel = JourneyViewModel()
    var saveResult: Bool
    @State var hasLiked = false
    
    var body: some View {
        HStack (alignment: .center, spacing: 10) {
            
            Button(action: {
                if (saveResult == true) {
                    viewModel.addResult(result: dynamicResult, callback: {_ in})
                }
                viewRouter.currentPage = viewRouter.previousPage
            }, label: {
                Label("Voltar", systemImage: "chevron.backward")
                    .onnaFont(.body)
                    .foregroundColor(.onnaWhite)
                    .padding(EdgeInsets(top:0, leading: 14, bottom: 0, trailing: 0))
            })
            
            Spacer()
            
            Text(conteudoName)
                .onnaFont(.body)
                .foregroundColor(.onnaWhite)
            
            Spacer()
            
            Button(action: {
                if (journeyViewModel.hasLike == true) {
                    journeyViewModel.dislike(entityId: dynamicResult.entityId, entityName: dynamicResult.entityName, callback: {isSuccess in
                        if(isSuccess) {
                            getHasLike()
                        }
                    })
                } else {
                    journeyViewModel.like(entityId: dynamicResult.entityId, entityName: dynamicResult.entityName, callback: {isSuccess in
                        if(isSuccess) {
                            getHasLike()
                        }
                    })
                }
            }) {
                Image(systemName: hasLiked == false ? "heart" : "heart.fill")
                    .imageScale(.large)
                    .foregroundColor(Color.onnaPink)
            }
            .padding()
        }
        .onAppear {
            getHasLike()
        }
        .padding(.top, 35)
    }
    
    func getHasLike() {
        journeyViewModel.contentHasLike(entityId: dynamicResult.entityId, entityName: dynamicResult.entityName, callback: {isSuccess in
            if (isSuccess) {
                hasLiked = journeyViewModel.hasLike!
            }
        })
    }
}

//struct ConteudoVoltarView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
//            ConteudoVoltarView(conteudoName: "Feminismo", saveResult: true)
//        }
//    }
//}
