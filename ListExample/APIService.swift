//
//  APIService.swift
//  ListExample
//
//  Created by Виталий Таран on 22.12.2022.
//

import Foundation
import Combine

class APIService {
    static let shared = APIService()
    // 1
    func getUsers(perPage: Int = 30, sinceId: Int? = nil) -> AnyPublisher<[User], Error> {
        // 2
        var components = URLComponents(string: "https://api.github.com/users")!
        components.queryItems = [
            URLQueryItem(name: "per_page", value: "\(perPage)"),
            URLQueryItem(name: "since", value: (sinceId != nil) ? "\(sinceId!)" : nil)
        ]
        // 3
        let request = URLRequest(url: components.url!, timeoutInterval: 10)
        // 4
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
