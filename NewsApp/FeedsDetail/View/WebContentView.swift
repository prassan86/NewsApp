//
//  WebContentView.swift
//  NewsApp
//
//  Created by Nagarajan, Karunakaran on 6/10/20.
//

import Foundation
import SwiftUI
import WebKit

struct WebContentView : UIViewRepresentable {
    
    let url : String
    
    func makeUIView(context: Context) -> WKWebView  {
        guard let url = URL(string: self.url)else {
            return WKWebView()
        }
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.websiteDataStore = WKWebsiteDataStore.nonPersistent()
        let request = URLRequest(url: url)
        let wkWebview = WKWebView(frame: .zero , configuration: webConfiguration)
        wkWebview.load(request)
        return wkWebview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
}
