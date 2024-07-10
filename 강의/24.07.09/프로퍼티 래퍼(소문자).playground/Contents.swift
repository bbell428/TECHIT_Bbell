import Foundation

@propertyWrapper
struct FixCase {
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get {
            return value
        }
        
        set {
            value = newValue.lowercased()
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}

struct MyComputer {
    
    @FixCase var kind: String
    
    var dateOfPurchase: String
    var price: Int
    
    func displayComputer() -> String {
        return "\(kind), \(dateOfPurchase), \(price)"
    }
    
}

var myMac: MyComputer = MyComputer(kind: "MaCBoOk", dateOfPurchase: "2", price: 3)
myMac.dateOfPurchase = "2022-04-01"
myMac.price = 100
print(myMac.displayComputer())
