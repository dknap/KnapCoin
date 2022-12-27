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
        ZStack {
            Color(colors.cryptoBlue)
                .edgesIgnoringSafeArea(.all)
                
            VStack {
                Text(names.appName)
                    .font(.custom("Impact", size: 40))
                    .foregroundColor(.white)
                NavigationView {
                    List(networkManager.posts) { post in
                        HStack {
                            VStack {
                                Text(post.headline)
                                Text("source: \(post.source)")
                                    .font(.system(size: 12))
                            }
                        }
                    }
                }.navigationTitle(names.appName)
            }
            
            .onAppear {
                networkManager.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
