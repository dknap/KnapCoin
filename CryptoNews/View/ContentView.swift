//
//  ContentView.swift
//  CryptoNews
//
//  Created by EniaKz on 26/12/2022.
//

import SwiftUI

let colors = Colors()
let names = Names()

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(colors.cryptoBlue)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text(names.appName)
                        .font(.custom("Impact", size: 40))
                        .foregroundColor(.white)
                    
                    List(networkManager.posts) { post in
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
                                .background(Color.white)
                                .overlay(Circle().stroke(Color(colors.cryptoBlue), lineWidth: 10))
                        }
                    }.padding(.horizontal, 30)
                }
            }
            .onAppear {
                networkManager.fetchData()
            }
        }
    }
}

struct ChartsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Charts")

            }
//            .navigationBarTitle("Current prices")
            .navigationBarHidden(true)
        }
    }
}

struct PricesView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Prices")

            }
//            .navigationBarTitle("Current prices")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

