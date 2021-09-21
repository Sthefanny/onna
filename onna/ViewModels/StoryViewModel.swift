//
//  StoryViewModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import Foundation
import SwiftUI

class StoryViewModel: ObservableObject {
    @Published var story = [Story]()
    @Published var filteredStory = [Story]()
    
    func fetchStory() {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.storyUrl.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let story = try? JSONDecoder().decode([Story].self, from: data!) else {
                    return
                }
                DispatchQueue.main.async {
                    self.story = story
                }
            }
        })
        
        task.resume()
    }
    
    func filterStory(by filter: String) {
        filteredStory = story.filter({ $0.story == filter })
    }
}
