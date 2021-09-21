//
//  QuizHelper.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 19/09/21.
//

import Foundation

class QuizHelper {
    static func saveQuizAnswers(quizId: Int, totalQuestions: Int) {
        var answers = [QuizSavedAnswer]()
        let quiz = getQuizAnswersByQuizId(quizId: quizId)
        
        let newQuizAnswer = QuizSavedAnswer(quizId: quizId, totalQuestion: totalQuestions, correctQuestions: quiz != nil ? quiz!.correctQuestions + 1 : 1)
        answers.append(newQuizAnswer)

        do {
            let encoder = JSONEncoder()

            let data = try encoder.encode(answers)

            UserDefaults.standard.set(data, forKey: UserDefaultsKeys.actualQuizes.name)

        } catch {
            print("Unable to Encode Array of Quiz Answers (\(error))")
        }
    }
    
    static func getQuizAnswers() -> [QuizSavedAnswer]? {
        var answers: [QuizSavedAnswer]?
        
        if let data = UserDefaults.standard.data(forKey: UserDefaultsKeys.actualQuizes.name) {
            do {
                let decoder = JSONDecoder()

                answers = try decoder.decode([QuizSavedAnswer].self, from: data)

            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        return answers
    }
    
    static func getQuizAnswersByQuizId(quizId: Int) -> QuizSavedAnswer? {
        let answers = getQuizAnswers()
        if (answers == nil) {
            return nil
        }
        
        return answers!.first(where: { QuizSavedAnswer in
            QuizSavedAnswer.quizId == quizId
        })
    }
    
    static func cleanAnswersByQuizId(quizId: Int) {
        var answers = getQuizAnswers()
        let quiz = getQuizAnswersByQuizId(quizId: quizId)
        
        if (quiz != nil) {
            answers?.removeAll(where: { QuizSavedAnswer in
                QuizSavedAnswer.quizId == quizId
            })

            do {
                let encoder = JSONEncoder()

                let data = try encoder.encode(answers)

                UserDefaults.standard.set(data, forKey: UserDefaultsKeys.actualQuizes.name)

            } catch {
                print("Unable to Encode Array of Quiz Answers (\(error))")
            }
        }
    }
}
