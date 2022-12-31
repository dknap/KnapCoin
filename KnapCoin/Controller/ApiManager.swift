//
//  ApiManager.swift
//  CryptoNews
//
//  Created by EniaKz on 26/12/2022.
//

import SwiftUI

let apiKeys = ApiKeys()

class ApiManager: ObservableObject {
    
    @Published var posts = [News]()
    let token = apiKeys.newsToken
    
    func newsData() {
        if let url = URL(string: "https://finnhub.io/api/v1/news?category=crypto&token=\(token)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode([News].self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
