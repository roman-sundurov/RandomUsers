//
//  UserData.swift
//  RandomUsers
//
//  Created by Roman on 13.07.2022.
//

import Foundation

@MainActor
class UserData: ObservableObject {
    @Published var users: [User] = []

    func loadUsers() async throws {
        let users = try await UserFetchingClient.getUsers()
        self.users = users
    }
}
