//
//  File.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Analytics
import Combine
import Foundation
import StarWarsAPI

public class HomeViewModel: ObservableObject {
    private let analyticsTracker: AnalyticsTracking!
    private let apiClient: StarWarsAPIClient!
    @Published private(set) var movies: [Movie] = []
    @Published private(set) var error: Error?
    @Published var showError: Bool = false

    public init(apiClient: StarWarsAPIClient = StarWarsAPIClient(), analyticsTracker: AnalyticsTracking = AnalyticsTracker()) {
        print(#function)
        self.apiClient = apiClient
        self.analyticsTracker = analyticsTracker
    }

    public init(movies: [Movie]) {
        print(#function)
        apiClient = StarWarsAPIClient()
        analyticsTracker = AnalyticsTracker()
        self.movies = movies
    }

    public func fetchData() {
        print(#function)
        showError = false
        apiClient.getMovies { [weak self] result in
            guard let self = self else { return }
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

// MARK: - Track

extension HomeViewModel {
    func trackScreenView() {
        let event = AnalyticsScreenViewEvent(name: .viewed, category: .home, properties: nil)
        analyticsTracker.trackScreenViewEvent(event)
    }
}
