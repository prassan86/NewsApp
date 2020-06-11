//
//  ContentView.swift
//  NewsApp
//
//  Created by Nagarajan, Karunakaran on 6/9/20.
//

import SwiftUI

struct FeedHome: View {
    
    var body: some View {
        
        NavigationView(){
            FeedView()
                .navigationBarTitle(Text("News"),displayMode: .inline)
            
        }.phoneOnlyStackNavigationView()
    }
}

struct FeedView : View {
    @EnvironmentObject var feedViewModel : FeedViewModel
    @State var setNaviagtion : Bool = false
    @State var indexSelected : Int = 0
    @State var searchText: String = ""

    var body: some View {
        VStack(){
            
            if (self.feedViewModel.articles.count > 0 ){
                SearchBar(text: self.$searchText, placeholder: "Search Feeds")

                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(){
                        
                        ForEach(0..<self.feedViewModel.articles.filter {
                            self.searchText.isEmpty ? true : $0.title?.lowercased().contains(self.searchText.lowercased()) as! Bool}.count,id: \.self) { index in
                            FeedsCardHome(article: (self.feedViewModel.articles.filter {
                            self.searchText.isEmpty ? true : $0.title?.lowercased().contains(self.searchText.lowercased()) as! Bool}[index]))
                                .onTapGesture {
                                    self.indexSelected = index
                                    self.setNaviagtion.toggle()
                            }
                            .shadow(color: Color.black.opacity(0.18), radius: 5, x:1, y:1)
                            .padding(.leading,12)
                        }
                    }
                }
                NavigationLink(destination:FeedDetailsView(article: self.feedViewModel.articles.filter {
                self.searchText.isEmpty ? true : $0.title?.lowercased().contains(self.searchText.lowercased()) as! Bool}[self.indexSelected] ),isActive: self.$setNaviagtion) { EmptyView()}
            } else{
                Text("Fetching Data ...")
            }
            Spacer()
        }
        
    }
}


extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}

