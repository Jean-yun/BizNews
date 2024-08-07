//
//  NetworkManager.swift
//  BizNews
//
//  Created by 윤진영 on 7/19/24.
//

import Foundation

class NetworkManager: ObservableObject {
    
   @Published var posts = [Post] ()
    
    func fetchData() {
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a49b9ad95290425faa3b478d271ea0d4") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.articles }
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

