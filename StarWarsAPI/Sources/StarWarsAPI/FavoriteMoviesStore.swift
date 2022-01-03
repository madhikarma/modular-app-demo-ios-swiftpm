//
//  FavoriteMoviesStore.swift
//
//
//  Created by Shagun Madhikarmi on 25/12/2021.
//

import Combine
import Foundation

public class FavoriteMoviesStore: ObservableObject {
    @Published var favoriteMovies: [Movie] = []

    public init() {}
}
