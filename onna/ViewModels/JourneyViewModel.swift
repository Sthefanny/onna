//
//  JourneyViewModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 08/09/21.
//

import Foundation
import SwiftUI

class JourneyViewModel: ObservableObject {
    @Published var journey = [Journey]()
    @Published var filteredJourney = [Journey]()
    
    func fetchJourney(callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.journeyUrl.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        print("request = \(request)")
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let journey = try? JSONDecoder().decode([Journey].self, from: data!) else {
                    callback(false)
                    return
                }
                DispatchQueue.main.async {
                    self.journey = journey
                    
                    callback(true)
                }
            }
        })
        
        task.resume()
    }
    
    func filterJourney(by filter: String) {
        filteredJourney = journey.filter({ $0.title == filter })
    }
}
