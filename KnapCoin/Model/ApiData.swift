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

struct Bitcoin: Decodable {
    let c: Double       // Current price
    let d: Double       // Change
    let dp: Double      // Daily percent change
    let h: Double       // High price of the day
    let l: Double       // Low price of the day
    let o: Double       // Open price of the day
    let pc: Double      // Previous close price
}
