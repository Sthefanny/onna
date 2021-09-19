//
//  QuizResultView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 18/09/21.
//

import SwiftUI

struct QuizResultView: View {
    @State var quizId: Int
    @State var quizSavedAnswer: QuizSavedAnswer?
    @State var quizResultType: QuizResultType?
    
    init(_ quizId: Int) {
        self.quizId = quizId
    }
    
    var body: some View {
        ZStack (alignment: .top) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            if(quizResultType != nil) {
                VStack {
                    ConteudoVoltarView(conteudoName: "QUIZ")
                        .padding(.top, -40)
                    
                    _buildResultQuantity
                    _buildResultTitle
                    _buildResultDescription
                    Spacer()
                    _buildResultImage
                    Spacer()
                    _buildResultPostDescription
                }
            } else {
                LoadingView()
            }
        }
        .onAppear {
            quizSavedAnswer = QuizHelper.getQuizAnswersByQuizId(quizId: quizId)
            quizResultType = quizSavedAnswer!.correctQuestions >= (quizSavedAnswer!.totalQuestion / 2) ? .positive : .negative
        }
    }
    
    var _buildResultQuantity: some View {
        Text("\(quizSavedAnswer!.correctQuestions) de \(quizSavedAnswer!.totalQuestion)")
            .onnaFont(.body)
            .foregroundColor(.onnaPink)
    }
    
    var _buildResultTitle: some View {
        Text(quizResultType == .positive ? "YAYYY!!" : "Quase!")
            .onnaFont(.title1)
            .foregroundColor(.onnaWhite)
            .padding(.vertical, 5)
    }
    
    var _buildResultDescription: some View {
        Text(quizResultType == .positive ? "ESTUDANDO PARA SER ESTUDANTE DE GINECOLOGISTA. Você deve estar estudando para ser ginecologista porque você sabe MUITO sobre o processo de menstruação! Mandou muito bem." : "Você até que sabe bastante sobre menstruação, apesar de ter errado algumas perguntas. Tente novamente — temos certeza que agora você vai acertar todas!")
            .onnaFont(.callout)
            .foregroundColor(.onnaWhite)
            .multilineTextAlignment(.center)
            .frame(width: 280)
            .padding(.vertical, 5)
    }
    
    var _buildResultImage: some View {
        Image(quizResultType == .positive ? "quiz-positive": "quiz-negative")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 370, height: 370, alignment: .center)
    }
    
    var _buildResultPostDescription: some View {
        Text(quizResultType == .positive ? "É sobre isso né mores, sobre arrasar, mas não para por ai, possuimos mais conteúdos para você servir todo sua destreza." : "E tá tudo bem, possuimos  conteúdos quentissimos para você aprender e  saber mais sobre  o assunto.")
            .onnaFont(.callout)
            .foregroundColor(.onnaWhite)
            .multilineTextAlignment(.center)
            .frame(width: 280)
            .padding(.vertical, 20)
    }
}

enum QuizResultType {
    case negative
    case positive
}

struct QuizResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultView(1)
    }
}
