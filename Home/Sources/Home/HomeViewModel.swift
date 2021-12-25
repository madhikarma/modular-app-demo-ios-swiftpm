//
//  File.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Combine
import Foundation
import StarWarsAPI

public class HomeListViewModel: ObservableObject {
    private let starWarsAPIClient = StarWarsAPIClient()
    @Published var movies: [Movie] = []

    public init() {}

    public init(movies: [Movie]) {
        self.movies = movies
    }

    public func fetchData() {
        starWarsAPIClient.getMovies { result in
            switch result {
            case let .success(response):
                print(response)
                self.movies = response.results
            case let .failure(error):
                print(error)
            }
        }
    }
}
