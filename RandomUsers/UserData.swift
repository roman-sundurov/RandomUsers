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

  init() {
    Task {
      await loadUsers()

    }
  }

  func loadUsers() async {
    do {
      let users = try await UserFetchingClient.getUsers()
      self.users = users
    } catch {
      print(error)
    }
  }
}
