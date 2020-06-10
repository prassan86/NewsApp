//
//  ContentView.swift
//  NewsApp
//
//  Created by Nagarajan, Karunakaran(AWF) on 6/9/20.
//  Copyright © 2020 Nagarajan, Karunakaran(AWF). All rights reserved.
//

import SwiftUI

struct FeedHome: View {
    @ObservedObject var feedViewModel : FeedViewModel = FeedViewModel()
    var body: some View {

        NavigationView(){
            NavigationLink(destination: Text("123")){

        VStack(){
            List {
                VStack(alignment: .leading, spacing: 0.0){
                    ForEach(0..<(self.feedViewModel.headlinesResponse?.articles.count ?? 0),id: \.self) { index in
                         FeedsCardHome(article: (self.feedViewModel.headlinesResponse?.articles[index])!)
                            .padding(.bottom,12)
                    }
                }
            }
          // .shadow(color: Color.black.opacity(0.18), radius: 5, x:1, y:1)
           

        } .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitle(Text("Home"),displayMode: .inline)
        .onAppear(){
           // self.feedViewModel.fetchNewsData()
        }
        }
        }
    }
}

