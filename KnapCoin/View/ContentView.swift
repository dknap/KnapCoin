//
//  ContentView.swift
//  KnapCoin
//
//  Created by EniaKz on 26/12/2022.
//

import SwiftUI

let colors = Colors()
let names = Names()

struct ContentView: View {
    
    @ObservedObject var apiManager = ApiManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(colors.cryptoBlue)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text(names.appName)
                        .font(.custom("Impact", size: 40))
                        .foregroundColor(.white)
                    
                    List(apiManager.posts) { post in
                        HStack {
                            VStack {
                                Text(post.headline)
                                Text("source: \(post.source)")
                                    .font(.system(size: 12))
                            }
                        }
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink {
                            ChartsView()
                        } label: {
                            Image(systemName: "chart.line.uptrend.xyaxis.circle.fill")
                                .padding(.horizontal, 10)
                                .font(.system(size: 50))
                                .foregroundColor(Color(colors.cryptoBlue))
                                .overlay(Circle().stroke(Color(colors.cryptoBlue), lineWidth: 10))
                        }
                        
                        NavigationLink {
                            PricesView()
                        } label: {
                            Image(systemName: "dollarsign.circle.fill")
                                .padding(.horizontal, 3)
                                .font(.system(size: 50))
                                .foregroundColor(Color(colors.cryptoBlue))
                                .overlay(Circle().stroke(Color(colors.cryptoBlue), lineWidth: 10))
                        }.onAppear {
                            
                        }
                    }.padding(.horizontal, 30)
                }
            }
            .onAppear {
                apiManager.newsData()
                
            }
        }
    }
}

struct ChartsView: View {
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationBarHidden(true)
        }
    }
}

struct PricesView: View {
    @ObservedObject var coinMonitor = CoinGecko()
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationBarHidden(true)
        }
        .onAppear() {
            coinMonitor.getBtcPrice()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

