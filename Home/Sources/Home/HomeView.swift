//
//  HomeListView.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import StarWarsAPI
import SwiftUI

struct HomeView: View {
    private let viewModel: HomeListViewModel

    public init(viewModel: HomeListViewModel = HomeListViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List(viewModel.movies) { movie in
            Text(movie.title)
        }.onAppear {
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
        let movie = Movie(title: "A New Hope", episodeID: 4, openingCrawl: "", director: "", producer: "", releaseDate: "", characters: [], planets: [], starships: [], vehicles: [], species: [], created: "", edited: "", url: "")
        let movies = [movie]
        let viewModel = StubHomeViewModel(movies: movies)
        HomeView(viewModel: viewModel)
    }
}
