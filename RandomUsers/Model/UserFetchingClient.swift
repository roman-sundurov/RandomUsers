//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Roman on 12.07.2022.
//

import Foundation

enum AppErrors: String, Error {
    case urlError = "URL error"
}

struct Response: Decodable {
    let users: [User]

    private enum CodingKeys: String, CodingKey {
        case users = "results"
    }
}

struct UserFetchingClient {
    static private let url = URL(string: "https://randomuser.me/api/?results=10&format=pretty")

    static func getUsers() async throws -> [User] {
        if let url = url {
            async let (data, _) = URLSession.shared.data(from: url)
            return try await JSONDecoder().decode(Response.self, from: data).users
        } else {
            throw AppErrors.urlError
        }
    }
}
