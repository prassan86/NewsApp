//
//  FeedViewModel.swift
//  NewsApp
//
//  Created by Nagarajan, Karunakaran on 6/9/20.
//

import Foundation

class FeedViewModel : ObservableObject {
    
    let apiUrl : String = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=fc4140479c2240f899b0e47a4a11b370"
    @Published var articles : [Article] = []
    var headlinesResponse : HeadlinesResponse?
    
    init (){
        self.fetchNewsData()
    }
    func fetchNewsData(){
        guard let url = URL(string: apiUrl)else {return}
        URLSession.shared.dataTask(with:url){(data,response,error) in
            DispatchQueue.main.async {
                self.headlinesResponse = try? JSONDecoder().decode(HeadlinesResponse.self, from: data!)
                if let articlesArray = self.headlinesResponse?.articles{
                    self.articles = articlesArray
                }
            }
        }.resume()
    }
}
