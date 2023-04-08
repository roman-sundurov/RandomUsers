//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Roman on 12.07.2022.
//

import Foundation

struct UserFetchingClient {
    static private let url = URL(string: "https://randomuser.me/api/?results=10&format=pretty")

    static func getUsers() async throws -> [User] {
        if let url = url {
            async let (data, _) = URLSession.shared.data(from: url)
            let response = try await JSONDecoder().decode(Response.self, from: data)
            return response.users
        } else {
            throw AppErrors.urlError
        }
    }
}

enum AppErrors: String, Error {
    case urlError = "URL error"
}
