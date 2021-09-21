//
//  BlogViewModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import Foundation
import SwiftUI

class BlogViewModel: ObservableObject {
    @Published var blog = [Blog]()
    @Published var filteredBlog = [Blog]()
    
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
                guard let blog = try? JSONDecoder().decode([Blog].self, from: data!) else {
                    return
                }
                DispatchQueue.main.async {
                    self.blog = blog
                }
            }
        })
        
        task.resume()
    }
    
    func filterBlog(by filter: String) {
        filteredBlog = blog.filter({ $0.page == filter })
    }
}
