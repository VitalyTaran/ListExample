//
//  UserViewModel.swift
//  ListExample
//
//  Created by Виталий Таран on 22.12.2022.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    // 1
    @Published var users: [User] = []
    @Published var isRequestFailed = false
    // 2
    private let pageLimit = 25
    private var currentLastId: Int? = nil
  
    private var cancellable: AnyCancellable?
    
    func getUsers() {
        // 3
        cancellable = APIService.shared.getUsers(perPage: pageLimit, sinceId: currentLastId)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    // 4
                    self.isRequestFailed = true
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: { users in
                // 5
                self.users.append(contentsOf: users)
                self.currentLastId = users.last?.id
            }
    }
}
