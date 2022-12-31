//
//  ApiManager.swift
//  CryptoNews
//
//  Created by EniaKz on 26/12/2022.
//

import SwiftUI

let cryptoAPI = NewsAPI()

class ApiManager: ObservableObject {
    
    @Published var posts = [News]()
    var btc: Bitcoin?
    let token = cryptoAPI.token
    
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
    
    func bitcoinData() {
        
        if let url = URL(string: "https://finnhub.io/api/v1/quote?symbol=BINANCE:BTCUSDT&token=\(token)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let btcInfo = try decoder.decode(Bitcoin.self, from: safeData)
                            DispatchQueue.main.async {
//                                self.btc = btcInfo
                                let price = btcInfo.c
                                print(price)
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
