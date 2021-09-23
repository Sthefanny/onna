//
//  BlogViewModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import Foundation
import SwiftUI

class BlogViewModel: ObservableObject {
    @Published var blogs = [Blog]()
    @Published var filteredBlog = [Blog]()
    @Published var blog: Blog?
    
    func fetchBlog() {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.blogUrl.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let blogs = try? JSONDecoder().decode([Blog].self, from: data!) else {
                    return
                }
                DispatchQueue.main.async {
                    self.blogs = blogs
                }
            }
        })
        
        task.resume()
    }
    
    func filterBlog(by filter: String) {
        filteredBlog = blogs.filter({ $0.page == filter })
    }
    
    func getBlog(id: Int, callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.blogUrl.text)/\(id)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let blog = try? JSONDecoder().decode(Blog.self, from: data!) else {
                    callback(false)
                    return
                }
                DispatchQueue.main.async {
                    self.blog = blog
                    
                    callback(true)
                }
            }
        })
        
        task.resume()
    }
}
