//struct Student {
//    private var inName: String = ""
//    private var inNickname: String = ""
//    
//    var name: String {
//        get {
//            return inName
//        }
//        
//        set {
//            // inName으로 저장할 때
//            // 모든 글자를 대문자로 만들어줍시다
//            inName = newValue.uppercased()
//        }
//    }
//    
//    var nickname: String {
//        get {
//            return inNickname
//        }
//        
//        set {
//            inNickname = newValue.uppercased()
//        }
//    }
//}
//
//var ned: Student = Student()
//ned.name = "Ned Park"
//print(ned.name) // NED PARK
//ned.nickname = "icebomb"
//print(ned.nickname) // ICEBOMB

// --------------------------------------------------------------------------------------------------------------

//@propertyWrapper // 프로퍼티 래퍼 정의
//struct Uppercased {
//    private var value: String = ""
//
//    var wrappedValue: String {
//        get {
//            return value
//        }
//        
//        set {
//            value = newValue.uppercased()
//        }
//    }
//}
//
//struct Student {
//    @Uppercased var name: String // 위에서 정의한 프로퍼티를 적용
//    @Uppercased var nickname: String
//}
//
//var ned: Student = Student()
//ned.name = "Ned Park"
//print(ned.name) // NED PARK
//ned.nickname = "icebomb"
//print(ned.nickname) // ICEBOMB


// --------------------------------------------------------------------------------------------------------------


//// 프로퍼티래퍼는 각 구조체나 클래스의 프로퍼티 앞에
//// @FixCase 같은 머릿말을 붙여
//// 다음의 코드가 작동되면서 해당 프로퍼티 값이 활용되게 한다
@propertyWrapper
struct FixCase {
    // 적어도 이 프로퍼티래퍼의 구조체를 직접 건든다해도
    // 이 안의 value라는 변수 값을 외부에서 직접
    // 업데이트 할 수 없도록 한다
    private(set) var value: String = ""
    
    // 외부에선 해당 프로퍼티의 값을
    // wrappedValue라는 연산프로퍼티를 통해
    // 읽고 쓴다
    var wrappedValue: String {
        get {
            return value
        }
        
        set {
            value = newValue.uppercased()
        }
    }
    
    // 처음 만들때부터 wrappedValue에 의해서
    // 값이 생기고 관리되도록 한다
    init(wrappedValue initialValue: String) {
        // 내부의 연산프로퍼티에
        // 초기화될 데이터를 할당 시도
        self.wrappedValue = initialValue
    }
}
//
//
//struct Student {
//    @FixCase var name: String
//    @FixCase var nickname: String
//}
//
//var ned: Student = Student(name: "Ned Park", nickname: "icebomb")
//print(ned.name) // NED PARK
//print(ned.nickname) // ICEBOMB


// --------------------------------------------------------------------------------------------------------------


//@propertyWrapper
//struct MinMaxVal {
//    var value: Int
//    let max: Int
//    let min: Int
//    
//    var wrappedValue: Int {
//        get {
//            return value
//        }
//        
//        set {
//            if newValue < min {
//                value = min
//            } else if newValue > max {
//                value = max
//            } else {
//                value = newValue
//            }
//        }
//    }
//    
//    init(wrappedValue: Int, min: Int, max: Int) {
//        self.value = wrappedValue
//        self.max = max
//        self.min = min
//    }
//}
//
//struct Demo {
//    @MinMaxVal(min: 100, max: 200) var value: Int = 100
//}
//
//var demo: Demo = Demo()
//demo.value = 150
//print(demo.value) // 150
//
//demo.value = 250
//print(demo.value) // 200
//
//demo.value = 50
//print(demo.value) // 100


// --------------------------------------------------------------------------------------------------------------


// 제너릭: 가상의 V라는 타입을 언급해서
// 이경우엔 Comparable 프로토콜을 따르는 무슨 타입이든
// 다 적용되게 범용 프로퍼티 래퍼가 되게 한다
@propertyWrapper
struct MinMaxVal<V: Comparable> {
    var value: V
    let max: V
    let min: V
    
    var wrappedValue: V {
        get {
            return value
        }
        
        set {
            // 비교를 위해선 해당 데이터의 타입이 Comparable 프로토콜을 따라야한다
            if newValue < min {
                value = min
            } else if newValue > max {
                value = max
            } else {
                value = newValue
            }
        }
    }
    
    init(wrappedValue: V, min: V, max: V) {
        self.value = wrappedValue
        self.max = max
        self.min = min
    }
}

struct Demo {
    @MinMaxVal(min: 100, max: 200) var value: Int = 100
    @MinMaxVal(min: 100.0, max: 200.0) var value2: Double = 100.12
    @MinMaxVal(min: "가나다", max: "다나카") var name: String = ""
}

var demo: Demo = Demo()
demo.value = 150
print(demo.value) // 150

demo.value = 250
print(demo.value) // 200

demo.value = 50
print(demo.value) // 100

demo.name = "abc"
print(demo.name) // 가나다

demo.name = "홍길동"
print(demo.name) // 다나카
