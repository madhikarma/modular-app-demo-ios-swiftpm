//
//  HomeListView.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import StarWarsAPI
import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel: HomeListViewModel

    public init(viewModel: HomeListViewModel = HomeListViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List(viewModel.movies) { movie in
            Text(movie.title)
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
        let movie1 = Movie(title: "A New Hope", episodeID: 4, openingCrawl: "", director: "", producer: "", releaseDate: "", characters: [], planets: [], starships: [], vehicles: [], species: [], created: "", edited: "", url: "")
        let movie2 = Movie(title: "Phantom Menace", episodeID: 4, openingCrawl: "", director: "", producer: "", releaseDate: "", characters: [], planets: [], starships: [], vehicles: [], species: [], created: "", edited: "", url: "")

        let movies = [movie1, movie2]
        let viewModel = StubHomeViewModel(movies: movies)
        HomeView(viewModel: viewModel)
    }
}
