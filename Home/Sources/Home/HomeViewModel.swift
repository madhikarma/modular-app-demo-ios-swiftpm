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
    private let apiClient: StarWarsAPIClient!
    @Published private(set) var items: [HomeViewListItem] = []
    @Published private(set) var error: Error?
    @Published var showError: Bool = false

    public init(apiClient: StarWarsAPIClient = StarWarsAPIClient()) {
        print(#function)
        self.apiClient = apiClient
    }

    public init(items: [HomeViewListItem]) {
        print(#function)
        apiClient = StarWarsAPIClient()
        self.items = items
    }

    public func fetchData() {
        print(#function)
        showError = false
        apiClient.getMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                self.items = response.results.compactMap { movie in
                    HomeViewListItem(id: movie.id, title: movie.title)
                }

            case let .failure(error):
                self.error = error
                self.showError = true
            }
        }
    }
}
