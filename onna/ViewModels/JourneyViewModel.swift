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

    func fetchJourney() {
        
        let path = "\(UrlConfig.baseUrl.text)\(UrlConfig.journeyUrl.text)"
        
//        let params = ["Authorization":"eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIyIiwidXNlck5hbWUiOiJTdGVsIEJ5cm4iLCJ1c2VyRW1haWwiOiJzdGVsIiwibmJmIjoxNjMxMTM4ODMzLCJleHAiOjE2MzExNDI0MzIsImlhdCI6MTYzMTEzODgzMywiaXNzIjoiRmluYW5jZSIsImF1ZCI6IkV2ZXJ5b25lIn0.kkKv0juSjKnuAtqMp3K_vFSpfOBvPrNYp9EOyFc12BB68gYMgxYOINeRiD-Hl9vBtYXnJEvwwHBSTCZYBhjrNg"] as Dictionary<String, String>

        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
//        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIyIiwidXNlck5hbWUiOiJTdGVsIEJ5cm4iLCJ1c2VyRW1haWwiOiJzdGVsIiwibmJmIjoxNjMxMTM4ODMzLCJleHAiOjE2MzExNDI0MzIsImlhdCI6MTYzMTEzODgzMywiaXNzIjoiRmluYW5jZSIsImF1ZCI6IkV2ZXJ5b25lIn0.kkKv0juSjKnuAtqMp3K_vFSpfOBvPrNYp9EOyFc12BB68gYMgxYOINeRiD-Hl9vBtYXnJEvwwHBSTCZYBhjrNg", forHTTPHeaderField: "Authorization")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                guard let journey = try? JSONDecoder().decode([Journey].self, from: data!) else {
                                print("Error")
                                return
                            }
                DispatchQueue.main.async {
                    self.journey = journey
                }
                print(journey)
            }
        })

        task.resume()
    }

    func filterJourney(by filter: String) {
        filteredJourney = journey.filter({ $0.title == filter })
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
