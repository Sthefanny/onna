//
//  PostViewModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 18/09/21.
//

import Foundation
import SwiftUI

class PostViewModel: ObservableObject {
    @Published var posts = [Post]()
    @Published var userPosts = [Post]()
    @Published var filteredPosts = [Post]()
    @Published var filteredUserPosts = [Post]()
    @Published var postWithComments: Post?
    @Published var likedPosts = [Post]()
    
    func fetchPosts(callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.postUrl.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let posts = try? JSONDecoder().decode([Post].self, from: data!) else {
                    callback(false)
                    return
                }
                DispatchQueue.main.async {
                    self.posts = posts
                    
                    callback(true)
                }
            }
        })
        
        task.resume()
    }
    
    func fetchYourPosts(callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.postByUserUrl.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let posts = try? JSONDecoder().decode([Post].self, from: data!) else {
                    callback(false)
                    return
                }
                DispatchQueue.main.async {
                    self.userPosts = posts
                    
                    callback(true)
                }
            }
        })
        
        task.resume()
    }
    
    func filterPosts(filter: String) {
        filteredPosts = posts.filter({ $0.text.lowercased().contains(filter.lowercased()) })
        filteredUserPosts = userPosts.filter({ $0.text.lowercased().contains(filter.lowercased()) })
    }
    
    func addPost(text: String, callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.postUrl.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        let params = ["text": text] as Dictionary<String, String>
        
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
    
    func fetchPostWithComments(postId: Int, callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.postWithComments.text)/\(postId)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let post = try? JSONDecoder().decode(Post.self, from: data!) else {
                    callback(false)
                    return
                }
                DispatchQueue.main.async {
                    self.postWithComments = post
                    
                    callback(true)
                }
            }
        })
        
        task.resume()
    }
    
    func addComment(postId: Int, text: String, callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.addCommentToPost.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        let params = ["postId": "\(postId)", "text": text] as Dictionary<String, String>
        
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
    
    func like(postId: Int, callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.postLike.text)/\(postId)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "POST"
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
    
    func dislike(postId: Int, callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.postLike.text)/\(postId)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "DELETE"
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
    
    func filterLikedPosts() {
        likedPosts = posts.filter({ $0.hasLiked == true })
    }

}
