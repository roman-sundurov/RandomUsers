//
//  User.swift
//  RandomUsers
//
//  Created by Roman on 18.07.2022.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: String
    let name: Name
    let picture: Picture

    var fullName: String { name.title + ". " + name.first + " " + name.last }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(Name.self, forKey: .name)
        picture = try values.decode(Picture.self, forKey: .picture)
        let loginInfo = try values.nestedContainer(
            keyedBy: LoginInfoCodingKeys.self,
            forKey: .login
        )
        id = try loginInfo.decode(String.self, forKey: .uuid)
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case login
        case picture
    }
    private enum LoginInfoCodingKeys: String, CodingKey {
        case uuid
    }
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}
