import Foundation

// 프로토콜은 ~able 형식으로 써주는 게 좋다
// 하지만 SwiftUI의 View처럼 명사가 안되는 건 아니다
// 프로토콜은 다른 프로콜도 따를 수 있다
protocol Car: Identifiable {
    var brand: String { get set }
    var name: String { get set }
    
    var seat: Int { get set }
    var door: Int { get set }
    
    func drive()
    
    func charge()
}

extension Car {
    func drive() {
        print("부릉부릉~")
    }
    
    func charge() {
        print("연료 주입중")
    }
}

protocol Gas {
    var gasMileage: Int { get set }
}

protocol Electric {
    var zeroback: Double { get set }
}

struct GasCar: Car, Gas {
    var id: UUID = UUID()
    
    var brand: String
    var name: String
    
    var seat: Int
    var door: Int
    
    var gasMileage: Int
    
    func charge() {
        print("기름을 넣고 있습니다")
    }
}

struct ElectricCar: Car, Electric {
    var id: UUID = UUID()
    
    var brand: String
    var name: String
    
    var seat: Int
    var door: Int
    
    var zeroback: Double
    
    func drive() {
        print("윙~")
    }
    
    func charge() {
        print("충전중")
    }
}

struct HybridCar: Car, Gas, Electric {
    var id: UUID = UUID()
    var brand: String
    var name: String
    
    var seat: Int
    var door: Int
    
    var gasMileage: Int
    
    var zeroback: Double
    
    func drive() {
        print("윙~ 또는 부릉부릉")
    }
    
    func charge() {
        print("전기 충전중 또는 기름 채우는 중")
    }
}


let gasCars: [GasCar] = [
    GasCar(brand: "제네시스", name: "G80", seat: 4, door: 4, gasMileage: 9),
    GasCar(brand: "현대자동차", name: "캐스퍼", seat: 4, door: 4, gasMileage: 13),
    GasCar(brand: "기아자동차", name: "K5", seat: 4, door: 4, gasMileage: 9)
]

let elecricCars: [ElectricCar] = [
    ElectricCar(brand: "테슬라", name: "모델3", seat: 4, door: 4, zeroback: 6.1),
    ElectricCar(brand: "쉐보레", name: "볼트EV", seat: 4, door: 4, zeroback: 7),
]

let hybridCars: [HybridCar] = [
    HybridCar(brand: "도요타", name: "프리우스", seat: 4, door: 2, gasMileage: 20, zeroback: 7.6)
]
