//
//  FeedModel.swift
//  NewsApp
//
//  Created by Nagarajan, Karunakaran on 6/9/20.

import Foundation
import SwiftUI

struct HeadlinesResponse: Codable,Hashable ,Identifiable {
    var id : UUID?
    var status: String?
    var totalResults: Int?
    var articles: [Article]
}

struct Article: Codable,Hashable,Identifiable  {
    var id : UUID?
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct Source: Codable,Hashable  {
    var id: String?
    var name: String?
}
