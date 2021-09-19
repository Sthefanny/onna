//
//  DynamicResultViewModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 16/09/21.
//

import Foundation
import SwiftUI

class DynamicResultViewModel: ObservableObject {
    @Published var dynamicResults = [DynamicResult]()
    
    func addResult(result: DynamicResult, callback: @escaping (Bool) -> Void) {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.dynamicResultUrl.text)"
        
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.name)!
        
        let params = ["journeyId": "\(result.journeyId)", "entityId": "\(result.entityId)", "entityName": "\(result.entityName)"] as Dictionary<String, String>
        
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
}
