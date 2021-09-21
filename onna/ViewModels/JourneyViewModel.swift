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
    @Published var favesJourney = [ContentLiked]()
    @Published var completedJourneys = [Journey]()
    @Published var journeyWithContent: JourneyWithContent?
    @Published var hasLike: Bool?
    
    func fetchJourney(callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.journeyUrl.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
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
    
    func getJourneyById(journeyId: Int, callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.journeyUrl.text)/\(journeyId)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let journey = try? JSONDecoder().decode(JourneyWithContent.self, from: data!) else {
                    callback(false)
                    return
                }
                DispatchQueue.main.async {
                    self.journeyWithContent = journey
                    
                    callback(true)
                }
            }
        })
        
        task.resume()
    }
    
    func filterJourney(by filter: String) {
        filteredJourney = journey.filter({ $0.title == filter })
    }
    
    func fetchCompletedJourneys(callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.completedJourneyUrl.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let journey = try? JSONDecoder().decode([Journey].self, from: data!) else {
                    callback(false)
                    return
                }
                DispatchQueue.main.async {
                    self.completedJourneys = journey
                    
                    callback(true)
                }
            }
        })
        
        task.resume()
    }
    
    func fetchFavoritesJourneys(callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.likedJourneyUrl.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let journey = try? JSONDecoder().decode([ContentLiked].self, from: data!) else {
                    callback(false)
                    return
                }
                DispatchQueue.main.async {
                    self.favesJourney = journey
                    
                    callback(true)
                }
            }
        })
        
        task.resume()
    }
    
    func like(entityId: Int, entityName: String, callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.likedJourneyUrl.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        let params = ["entityId": "\(entityId)", "entityName": entityName] as Dictionary<String, String>
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                if let httpResponse = response as? HTTPURLResponse {
                    DispatchQueue.main.async {
                        if (httpResponse.statusCode == 204) {
                            callback(true)
                        } else {
                            callback(false)
                        }
                    }
                }
            }
        })
        
        task.resume()
    }
    
    func dislike(entityId: Int, entityName: String, callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.likedJourneyUrl.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        let params = ["entityId": "\(entityId)", "entityName": entityName] as Dictionary<String, String>
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "DELETE"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                if let httpResponse = response as? HTTPURLResponse {
                    DispatchQueue.main.async {
                        if (httpResponse.statusCode == 204) {
                            callback(true)
                        } else {
                            callback(false)
                        }
                    }
                }
            }
        })
        
        task.resume()
    }
    
    func contentHasLike(entityId: Int, entityName: String, callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.contentHasLikeUrl.text)?EntityId=\(entityId)&EntityName=\(entityName)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let contentHasLike = try? JSONDecoder().decode(ContentHasLike.self, from: data!) else {
                    callback(false)
                    return
                }
                DispatchQueue.main.async {
                    self.hasLike = contentHasLike.exist
                    
                    callback(true)
                }
            }
        })
        
        task.resume()
    }
}
