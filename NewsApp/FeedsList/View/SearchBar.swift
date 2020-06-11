//
//  SearchBar.swift
//  NewsApp
//
//  Created by Nagarajan, Karunakaran on 6/9/20.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String
    var onSearchButtonClicked: (() -> Void)? = nil


    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String
        let control: SearchBar

        init(_ control: SearchBar,text:Binding<String>) {
            self.control = control
            _text = text

        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            control.text = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            control.onSearchButtonClicked?()
            searchBar.resignFirstResponder()
        }
        
        
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self, text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
       searchBar.placeholder = placeholder
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar,
                      context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
