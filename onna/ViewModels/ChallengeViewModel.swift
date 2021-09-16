//
//  ChallengeViewModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import Foundation
import SwiftUI

class ChallengeViewModel: ObservableObject {
    @Published var challenge = [Challenge]()
    @Published var filteredChallenge = [Challenge]()
    
    func fetchChallenge() {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.challengeUrl.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let challenge = try? JSONDecoder().decode([Challenge].self, from: data!) else {
                    return
                }
                DispatchQueue.main.async {
                    self.challenge = challenge
                }
            }
        })
        
        task.resume()
    }
    
    func filterChallenge(by filter: String) {
        filteredChallenge = challenge.filter({ $0.title == filter })
    }
}
