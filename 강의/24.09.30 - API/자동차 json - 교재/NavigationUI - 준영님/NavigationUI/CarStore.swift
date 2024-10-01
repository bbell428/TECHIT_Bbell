//
//  CarStore.swift
//  NavigationUI
//
//  Created by 박준영 on 9/11/24.
//

import SwiftUI
import Combine
import Observation

@Observable
class CarStore {
    var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
