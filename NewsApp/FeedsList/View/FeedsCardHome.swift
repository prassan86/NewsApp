//
//  FeedCardHome.swift
//  NewsApp
//
//  Created by Nagarajan, Karunakaran(AWF) on 6/9/20.
//  Copyright © 2020 Nagarajan, Karunakaran(AWF). All rights reserved.
//


import SwiftUI
//import SDWebImageSwiftUI

struct FeedsCardHome: View {
    var article : Article
     var body: some View {
        VStack(alignment: .leading) {
           /*
            WebImage(url: URL(string: self.feedResponse.imageUrl ))
                .resizable()
                .placeholder{
                    (Image("feed_placeholder")
                        .resizable()
                        .frame(minWidth: getDynamicFramesforCard(), maxWidth: getDynamicFramesforCard(), minHeight: 200,maxHeight: 200,alignment: .topLeading)
                        
                        .padding(.top,0)
                    )
            }//End Placeholder
                .clipped()
                .frame(minWidth: getDynamicFramesforCard(), maxWidth: getDynamicFramesforCard(), minHeight: 200,maxHeight: 200,alignment: .topLeading)
                .padding(.top,0)
            */
            Text(self.article.title)
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .foregroundColor(Color.primary)
                .lineLimit(2)
                .padding(.bottom, 4)
                .padding(.horizontal,16)
                .fixedSize(horizontal: false, vertical: false)
            
            Text(self.article.description)
                .font(.system(size: 15))
                .foregroundColor(Color.secondary)
                .lineLimit(3)
                .padding(.bottom, 20)
                .padding(.horizontal,16)
                .fixedSize(horizontal: false, vertical: false)
            Spacer()
        }
        .frame(minWidth:UIScreen.main.bounds.width - 24 , maxWidth:UIScreen.main.bounds.width - 24, minHeight: 335, maxHeight: 335)
        .background(Color.orange)
        .cornerRadius(10)
        
    }//End Body
    /*
    func getDynamicFramesforCard() -> CGFloat {
        if  modelType == "iPhone"  && orientationModel.portrait  {
            if numberOfFeeds == 1{
                return UIScreen.main.bounds.width - 24
            }else{
                return UIScreen.main.bounds.width - 44
            }
        }else{
            return 362.0
        }
    }//End getDynamicFramesforCard fuction */
}// End Struct
