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
    var body: some View {
        VStack(){
            if ((self.feedViewModel.headlinesResponse?.articles.count ?? 0) > 0 ){
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(){
                        ForEach(0..<(self.feedViewModel.headlinesResponse?.articles.count ?? 0),id: \.self) { index in
                            FeedsCardHome(article: (self.feedViewModel.headlinesResponse?.articles[index])!)
                                .onTapGesture {
                                    self.indexSelected = index
                                    self.setNaviagtion.toggle()
                            }
                            .shadow(color: Color.black.opacity(0.18), radius: 5, x:1, y:1)
                            .padding(.leading,12)
                        }
                    }
                }
                NavigationLink(destination:FeedDetailsView(article: self.feedViewModel.headlinesResponse?.articles[self.indexSelected] ?? Article()),isActive: self.$setNaviagtion) { EmptyView()}
            } else{
                Text("Fetching Data ...")
            }
            
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

