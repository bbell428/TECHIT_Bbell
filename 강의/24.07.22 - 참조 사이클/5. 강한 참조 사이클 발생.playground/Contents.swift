class Customer {
    let name: String
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    
    // 카드는 고객보다 더 짧은 life-cycle을 가지고 있을거라...
    unowned let customer: Customer
    
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var ned: Customer? = Customer(name: "Ned Park")
var card: CreditCard? = CreditCard(number: 123456, customer: ned!)

// 강한 참조 사이클 발생...
ned?.card = card

ned = nil // Ned Park is being deinitialized
card = nil // Card #123456 is being deinitialized



// ------------------------------------------------------------------------------------------------------------------------


//class Customer {
//    let name: String
//    var card: CreditCard?
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//class CreditCard {
//    let number: UInt64
//    
//    // 카드는 고객보다 더 짧은 life-cycle을 가지고 있을거라...
//    unowned let customer: Customer
//    
//    init(number: UInt64, customer: Customer) {
//        self.number = number
//        self.customer = customer
//    }
//    
//    deinit {
//        print("Card #\(number) is being deinitialized")
//    }
//}
//
//var ned: Customer? = Customer(name: "Ned Park")
//var card: CreditCard? = CreditCard(number: 123456, customer: ned!)
//
//ned?.card = card
//
//// unowned 덕분에 메모리에 누수 해결!
//ned = nil
//// Ned Park is being deinitialized
//// Card #123456 is being deinitialized
