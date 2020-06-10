//
//  FeedViewModel.swift
//  NewsApp
//
//  Created by Nagarajan, Karunakaran(AWF) on 6/9/20.
//  Copyright © 2020 Nagarajan, Karunakaran(AWF). All rights reserved.
//

import Foundation

class FeedViewModel : ObservableObject {
    
    let apiUrl : String = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=fc4140479c2240f899b0e47a4a11b370"
    @Published var headlinesResponse : HeadlinesResponse?
    // @Published var feedCount : Int = 0
    
    init(){
        self.fetchNewsData()
    }
    func fetchNewsData(){
        guard let url = URL(string: apiUrl)else {return}
        URLSession.shared.dataTask(with:url){(data,response,error) in
            DispatchQueue.main.async {
                self.headlinesResponse = try? JSONDecoder().decode(HeadlinesResponse.self, from: data!)
               // self.feedCount = self.headlinesResponse?.articles.count ?? 0
            }
        }.resume()
    }
}
