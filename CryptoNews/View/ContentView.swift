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
                
                HStack {
                    
                    NavigationLink {
                        ChartsView()
                    } label: {
                        Image(systemName: "arrowtriangle.backward.fill")
                            .padding(.horizontal, 3)
                            .font(.system(size: 30))
                            .foregroundColor(Color(colors.cryptoBlue))
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        PricesView()
                    } label: {
                        Image(systemName: "arrowtriangle.right.fill")
                            .padding(.horizontal, 3)
                            .font(.system(size: 30))
                            .foregroundColor(Color(colors.cryptoBlue))
                    }
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

