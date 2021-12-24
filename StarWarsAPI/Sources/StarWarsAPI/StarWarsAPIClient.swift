//
//  File.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Foundation
import Networking

public final class StarWarsAPIClient {
    private let network = Network()

    public init() {}

    public func getMovies(completion: (Result<MovieResponse, Error>) -> Void) {
        network.sendRequest(urlString: "https://swapi.dev/api/films") { data, response, error in
            print(Date())
            print(response)

            let result: Result<MovieResponse, Error>
            if let networkError = error {
                result = .failure(networkError)
            } else if let jsonData = data {
                do {
                    let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: jsonData)
                    print(movieResponse.results)
                    result = .success(movieResponse)
                } catch let jsonError {
                    result = .failure(jsonError)
                }
            }

            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
