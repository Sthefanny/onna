//
//  UserViewModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 13/09/21.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var user: User?
    
    func createAndLoginUser(callback: @escaping (Bool) -> Void) {
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.authUrl.text)"
        
        let params = [
            "firstName": self.user!.firstName!,
            "lastName": self.user!.lastName!,
            "email": self.user!.email,
            "password": self.user!.password,
            "image": self.user!.image!,
            "version": "1.0.0",
            "so": "iOS",
        ] as Dictionary<String, String>
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let user = try? JSONDecoder().decode(User.self, from: data!) else {
                    callback(false)
                    return
                }
                DispatchQueue.main.async {
                    self.user = user
                    
                    callback(true)
                }
            }
        })
        
        task.resume()
    }
    
    func loginUser(callback: @escaping (Bool) -> Void) {
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.loginUrl.text)"
        
        let params = ["email": self.user!.email, "password": self.user!.password] as Dictionary<String, String>
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let user = try? JSONDecoder().decode(User.self, from: data!) else {
                    callback(false)
                    return
                }
                DispatchQueue.main.async {
                    self.user = user
                    
                    callback(true)
                }
            }
        })
        
        task.resume()
    }
    
    func getUserInfo(callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.userInfo.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let user = try? JSONDecoder().decode(User.self, from: data!) else {
                    callback(false)
                    return
                }
                DispatchQueue.main.async {
                    self.user = user
                    
                    callback(true)
                }
            }
        })
        
        task.resume()
    }
    
    func updateUser(data: UserUpdate, callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.addCommentToPost.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        let params = ["firstName": "\(data.firstName)", "lastName": "\(data.lastName)", "image": "\(data.image)", "insta": "\(data.insta)", "phrase": "\(data.phrase)", "birthDate": "\(data.birthDate)"] as Dictionary<String, String>
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "PUT"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                if let httpResponse = response as? HTTPURLResponse {
                    print(response)
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
}
