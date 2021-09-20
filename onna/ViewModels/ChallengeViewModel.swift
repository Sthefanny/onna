//
//  ChallengeViewModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import Foundation
import SwiftUI

class ChallengeViewModel: ObservableObject {
    @Published var challenge: Challenge?
    
    func getChallengeById(challengeId: Int, callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.challengeUrl.text)/\(challengeId)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let challenge = try? JSONDecoder().decode(Challenge.self, from: data!) else {
                    callback(false)
                    return
                }
                DispatchQueue.main.async {
                    self.challenge = challenge
                    
                    callback(true)
                }
            }
        })
        
        task.resume()
    }
}
