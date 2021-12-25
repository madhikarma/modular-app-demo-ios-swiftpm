//
//  StarWarsAPIClient.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Foundation
import Networking

open class StarWarsAPIClient {
    private let network = Network()

    public init() {}

    public func getMovies(completion: @escaping (Result<MovieResponse, Error>) -> Void) {
        network.sendRequest(urlString: "https://swapi.dev/api/films") { data, response, error in
            print(Date())
            print(String(describing: response))

            var result: Result<MovieResponse, Error>
            if let networkError = error {
                result = .failure(networkError)
            } else if let jsonData = data {
                do {
                    let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: jsonData)
                    print(movieResponse.results)
                    result = .success(movieResponse)
                } catch let jsonError {
                    result = .failure(jsonError)
                }
            } else {
                let error = NSError(domain: "", code: -1, userInfo: nil)
                result = .failure(error)
            }

            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
