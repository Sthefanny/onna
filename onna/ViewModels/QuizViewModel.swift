//
//  QuizViewModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import Foundation
import SwiftUI

class QuizViewModel: ObservableObject {
    @Published var quiz = [Quiz]()
    @Published var filteredQuiz = [Quiz]()
    
    func fetchQuiz() {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.quizUrl.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let quiz = try? JSONDecoder().decode([Quiz].self, from: data!) else {
                    return
                }
                DispatchQueue.main.async {
                    self.quiz = quiz
                }
            }
        })
        
        task.resume()
    }
    
    func filterQuiz(by filter: String) {
        filteredQuiz = quiz.filter({ $0.title == filter })
    }
}
