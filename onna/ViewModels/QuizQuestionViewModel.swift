//
//  QuizQuestionViewModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 18/09/21.
//

import Foundation
import SwiftUI

class QuizQuestionViewModel: ObservableObject {
    @Published var quizQuestion: QuizQuestion?
    
    func getQuizQuestion(quizId: Int, questionIndex: Int, callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.quizUrl.text)/\(quizId)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let quizQuestion = try? JSONDecoder().decode(QuizQuestion.self, from: data!) else {
                    callback(false)
                    return
                }
                DispatchQueue.main.async {
                    self.quizQuestion = quizQuestion
                    
                    callback(true)
                }
            }
        })
        
        task.resume()
    }
}
