//
//  FeedDetailsView.swift
//  NewsApp
//
//  Created by Nagarajan, Karunakaran on 6/10/20.

import SwiftUI
import SDWebImageSwiftUI
struct FeedDetailsView : View {
    var article : Article
    var body : some View {
        VStack(){
            Text(article.title ?? "")
                .font(.headline)
                .padding(.bottom,12)
            WebImage(url: URL(string: self.article.urlToImage ?? ""))
                .resizable()
                .clipped()
                .frame(minWidth:UIScreen.main.bounds.width - 24, maxWidth: UIScreen.main.bounds.width - 24, minHeight: 200,maxHeight: 200,alignment: .topLeading)
                .padding(.bottom,12)
            Text(article.description ?? "")
                .font(.subheadline)
                .padding(.bottom,12)
            Text(article.content ?? "")
                .font(.subheadline)
                .padding(.bottom,12)
            Spacer()
        }.padding(.horizontal,12)
    }
}
