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
        ScrollView(.vertical){
            VStack(alignment: .leading, spacing: 0.0){
            WebImage(url: URL(string: self.article.urlToImage ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:UIScreen.main.bounds.width - 24,alignment: .topLeading)
                .padding(.bottom,12)
            Text(article.title ?? "")
                .font(.title)
                .padding(.bottom,12)
            HStack(alignment:.top, spacing: 0.0){
                Text(article.author ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.trailing,12)
                Text(DateUtility.formattedDate(dateString: self.article.publishedAt ?? "") )
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.horizontal,8)
            .padding(.bottom,12)
            Text(article.description ?? "")
                .font(.body)
                .padding(.bottom,12)
                .padding(.horizontal,8)
            NavigationLink(destination: WebContentView(url: article.url ?? "")){
            Text(article.url ?? "")
                .foregroundColor(Color.blue)
                .padding(.horizontal,8)
                .font(.footnote)
            }
            Spacer()
        }.padding(.horizontal,12)
    }
    }
}
