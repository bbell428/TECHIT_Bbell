import Foundation

//String -> name
//타입 -> 데이터
//class -> instance / 객체



//메서드: class 나 struct 안에 정의된 함수
//프로퍼티: class 나 struct 안에 정의된 변수


//인스턴스: class나 struct를 변수에 담은 것
//ex)
//let someStruct = MyStruct() //someStruct 는 MyStruct의 인스턴스라고 부름


// -----------------------------------


// 바깥세상에선 그냥 "변수"라 불리던 거
var name: String = "Ned"

// 바깥세상에선 그냥 "함수"라 불리던 거
func sayHello() {
    print(name)
}

// 바깥세상에선 그냥 함수호출이라 불리던 거
sayHello()


class Friend {
    // class로 선언된 타입으로 만들어지는
    // 데이터(instance/객체)세상에선
    // "프로퍼티(property)"라 부른다
    var name: String = "Ned"

    // 객체 세상에선
    // "메서드"라 부린다
    func sayHello() {
        print(name)
    }
    
    init() {
        print("인스턴스 생성!!!")
    }
}

// class이름이 곧 타입이니까
// 새로운 데이터(instance)를 만들어봅시다
let myFriend: Friend = Friend.init()

// 메서드 호출
myFriend.sayHello()

// 프로퍼티 접근
print(myFriend.name)


// 상속이란 개념을 사용하면
// class는 수퍼클래스의 내용을 이미 담고 있다고 생각하자!
class BestFriend: Friend {
    func sayHi() {
        print("너와 나의 연결고리!")
    }
    
    class func sayYourName() {
        print("우리끼린 이미 아는 사이!")
    }
}
print("------------상속-------------")

let myBestFriend: BestFriend = BestFriend()
myBestFriend.sayHi()
myBestFriend.sayHello()

// 클래스 메서드 호출
BestFriend.sayYourName()

// 클래스 메서드는 이미 만들어진 데이터 인스턴스에 호출 불가
// myBestFriend.sayYourName()

print("------------타입 메서드-------------")

class SomeClass {
  static func someTypeMethod() { //타입 메서드
    print("hello someclass")
  }
}

SomeClass.someTypeMethod() //타입메서드 호출하는법



print("------------클로저 이용-------------")
// 클로저를 이용해 초기화 될 데이터를 만들어 할당 가능
let message: String = {
    return "Hello"
}()

print(message)
