//
//  Network.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Foundation

public final class Network {
    public init() {}

    public func sendRequest(urlString: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let urlRequest = URLRequest(url: URL(string: urlString)!)
        URLSession.shared.dataTask(with: urlRequest, completionHandler: completion)
    }
}
