//
//  NewsData.swift
//  KnapCoin
//
//  Created by EniaKz on 26/12/2022.
//

import SwiftUI

struct API: Decodable {
    let posts: [News]
}

struct News: Decodable, Identifiable {
    let id: Int
    let category: String
    let headline: String
    let source: String
    let url: String
}

struct Coin: Decodable {
    let coinInfo: [Symbol]
}

struct Symbol: Decodable {
    let price: [String: Double]
}
