//
//  FeedCardHome.swift
//  NewsApp
//
//  Created by Nagarajan, Karunakaran on 6/9/20.
//


import SwiftUI
import SDWebImageSwiftUI

struct FeedsCardHome: View {
    var article : Article
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text(self.article.title ?? "")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .lineLimit(2)
                .padding(.bottom, 4)
                .padding(.horizontal,16)
            
            Text(self.article.description ?? "")
                .font(.subheadline)
                .foregroundColor(Color.white)
                .lineLimit(3)
                .padding(.bottom, 20)
                .padding(.horizontal,16)
        }
        .background(self.getBackgroungImage())
        .frame(width:UIScreen.main.bounds.width - 24,height: 335,alignment: .topLeading)
        .cornerRadius(10.0)
        
    }
    
    func getBackgroungImage() -> some View {
        return
            WebImage(url: URL(string: self.article.urlToImage ?? ""))
                .resizable()
                .clipped()
                .frame(width:UIScreen.main.bounds.width - 24,height: 335,alignment: .topLeading)
        
        
    }
}
