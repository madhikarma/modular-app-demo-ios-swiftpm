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
    @ObservedObject private var viewModel: HomeViewModel
    @EnvironmentObject private var favoriteMoviesStore: FavoriteMoviesStore // Note. can't use DI for EnvObject

    public init(viewModel: HomeViewModel = HomeViewModel()) {
        print(#function)
        self.viewModel = viewModel
//        self.favoriteMoviesStore = favoriteMoviesStore
    }

    var body: some View {
        List(viewModel.movies) { movie in
            Text(movie.title)
                .onTapGesture {
                    print("tapped \(movie)")
                }
        }.onAppear {
            print("onAppear...")
            viewModel.fetchData()
            viewModel.trackScreenView()
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
        }.environmentObject(favoriteMoviesStore)
    }
}

class StubHomeViewModel: HomeViewModel {
    override public func fetchData() {
        // do nothing
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
//        let item1 = HomeViewListItem(id: 1, title: "A new home")
//        let item2 = HomeViewListItem(id: 2, title: "A Phantom Menace")
//        let items = [item1, item2]

        let movie1 = Movie(title: "A Phantom Menace", episodeID: 1, openingCrawl: "", director: "", producer: "", releaseDate: "", characters: [], planets: [], starships: [], vehicles: [], species: [], created: "", edited: "", url: "")

        let movie2 = Movie(title: "A new hope", episodeID: 4, openingCrawl: "", director: "", producer: "", releaseDate: "", characters: [], planets: [], starships: [], vehicles: [], species: [], created: "", edited: "", url: "")
        let viewModel = StubHomeViewModel(movies: [movie1, movie2])
        HomeView(viewModel: viewModel)
    }
}
