//
//  HomeListView.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import StarWarsAPI
import SwiftUI

struct HomeView: View {
    // Reminder: convert to StateObject if passing down to child views
    @ObservedObject private var viewModel: HomeListViewModel

    public init(viewModel: HomeListViewModel = HomeListViewModel()) {
        print(#function)
        self.viewModel = viewModel
    }

    var body: some View {
        List(viewModel.items) { item in
            Text(item.title)
        }.onAppear {
            print("onAppear...")
            viewModel.fetchData()
        }.alert(isPresented: $viewModel.showError) {
            Alert(title: Text("Error"),
                  message: Text("Something went wrong"),
                  primaryButton: .default(Text("Retry")) {
                      print("Retry...")
                      viewModel.fetchData()
                  },
                  secondaryButton: .cancel())
        }.refreshable {
            print("Refresh...")
            viewModel.fetchData()
        }
    }
}

class StubHomeViewModel: HomeListViewModel {
    override public func fetchData() {
        // do nothing
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        let item1 = HomeViewListItem(id: 1, title: "A new home")
        let item2 = HomeViewListItem(id: 2, title: "A Phantom Menace")
        let items = [item1, item2]
        let viewModel = StubHomeViewModel(items: items)
        HomeView(viewModel: viewModel)
    }
}
