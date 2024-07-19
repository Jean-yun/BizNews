//
//  ContentView.swift
//  BizNews
//
//  Created by 윤진영 on 7/19/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) {post in
                Text(post.title)
            }
            .navigationTitle("BizNews")
        }
        .onAppear{
            self.networkManager.fetchData()
        }
    }
}
        
        

#Preview {
    ContentView()
}
