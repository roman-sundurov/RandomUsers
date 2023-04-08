//
//  RandomUsersTests.swift
//  RandomUsersTests
//
//  Created by Roman on 11.07.2022.
//

import XCTest
@testable import RandomUsers

class RandomUsersTests: XCTestCase {

    func testUserModel() throws {
        do {
            if let jsonData = try getTestJSONData() {
                _ = try JSONDecoder().decode(Response.self.self, from: jsonData)
            }
        } catch {
            XCTFail("Failed to decode JSON into the model: \(error)")
        }
    }

    private func getTestJSONData() throws -> Data? {
        guard let path = Bundle.main.path(forResource: "randomUsers", ofType: "json") else {
            // fatalError("randomUsers.json file not found")
            XCTFail("randomUsers.json file not found")
            return nil
        }
        let internalURL = URL(fileURLWithPath: path)
        let data = try? Data(contentsOf: internalURL)
        if let data = data {
            return data
        } else {
            XCTFail("getTestJSONData. data == nil.")
            return nil
        }
    }
}
