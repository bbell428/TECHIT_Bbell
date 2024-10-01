//
//  Country.swift
//  CounrtryAPI
//
//  Created by 김종혁 on 9/30/24.
//

import Foundation
import SwiftUI

struct Country: Codable, Identifiable {
    let id: Int
    let name: String
    let population: Int
    let capital, language: String
    let latitude, longitude: Double
    let image: String
}
