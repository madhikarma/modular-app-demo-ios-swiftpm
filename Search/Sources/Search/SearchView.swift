//
//  SwiftUIView.swift
//
//
//  Created by Shagun Madhikarmi on 25/12/2021.
//

import SwiftUI

struct SearchView: View {
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""

    var body: some View {
        List {
            ForEach(searchResults, id: \.self) { name in
                NavigationLink(destination: Text(name)) {
                    Text(name)
                }
            }
        }
        .searchable(text: $searchText) {
            ForEach(searchResults, id: \.self) { result in
                Text("Are you looking for \(result)?").searchCompletion(result)
            }
        }
    }

    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
