//
//  Happy.swift
//  HappyAPI
//
//  Created by 김종혁 on 9/30/24.
//

import Foundation

// MARK: - Car
struct Happy: Codable {
    let message: String
    let statusCode: Int
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let content, author: String
    let description, link: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}
