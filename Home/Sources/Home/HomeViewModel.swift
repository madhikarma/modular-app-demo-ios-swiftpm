//
//  File.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Combine
import Foundation
import StarWarsAPI

class StubStarWarsAPIClient: StarWarsAPIClient {}

public class HomeListViewModel: ObservableObject {
    private let apiClient: StarWarsAPIClient!
    @Published private(set) var movies: [Movie] = []
    @Published private(set) var error: Error?
    @Published var showError: Bool = false

    public init(apiClient: StarWarsAPIClient = StarWarsAPIClient()) {
        self.apiClient = apiClient
    }

    public init(movies: [Movie]) {
        apiClient = StubStarWarsAPIClient()
        self.movies = movies
    }

    public func fetchData() {
        showError = false
        apiClient.getMovies { result in
            switch result {
            case let .success(response):
                self.movies = response.results
            case let .failure(error):
                self.error = error
                self.showError = true
            }
        }
    }
}
