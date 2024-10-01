//
//  Car.swift
//  NavigationUI
//
//  Created by 박준영 on 9/11/24.
//

import Foundation
import SwiftUI

struct Car : Codable, Identifiable, Hashable {
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
}
