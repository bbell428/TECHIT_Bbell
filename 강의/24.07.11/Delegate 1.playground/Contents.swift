/*
 Delegate 패턴:
 클로저가 보편적으로 사용되는 Swift가 나오기 전에
 Objective-C에서 주로 사용하던 패턴
 
 프로토콜을 통해서 따로 대리자가 해줄 일들을 준비하면
 지정된 대리자에게 일을 시키는 누군가는 행복하다
 */

// 고쳐줄 수 있는 행동들을 프로토콜로 정해줍시다
protocol FixDelegate {
    func fix()
    func check()
}

// 고객이 있어야 고칠 일이 생기겠죠?
struct Customer {
    // 스스로 고칠 수 없으니, 수리해줄 "대리자"를 선정할 수 있습니다.
    // 타입 이름에는 프로토콜을 적어도 되더라구요!!!
    var delegate: FixDelegate?
    
    // 고객이 문제 상황을 맞는다면?
    func meetProblem() {
        if let delegate {
            // 대리인이 있다면 점검하고 고쳐달라고 시키기
            delegate.check()
            delegate.fix()
        }
    }
}

// 서비스센터는 그런 고칠 수 있는 일을 해줍니다
struct ServiceCentre: FixDelegate {
    func fix() {
        print("문제가 있어서 고쳐드렸습니다.")
    }
    
    func check() {
        print("문제가 있는지 봐드렸습니다.")
    }
}

let goodServiceCentre: ServiceCentre = ServiceCentre()
var ned: Customer = Customer(delegate: goodServiceCentre)
ned.meetProblem()
/*
 문제가 있는지 봐드렸습니다.
 문제가 있어서 고쳐드렸습니다.
 */

// 다른 서비스센터도 만들어볼까요?
struct ASCenter: FixDelegate {
    func fix() {
        print("새걸로 그냥 바꿔드림!")
    }
    
    func check() {
        print("어디한번 볼까요?!")
    }
}

// 다른 서비스센터를 찾아가봅시다
ned.delegate = ASCenter()
ned.meetProblem()
/*
 어디한번 볼까요?!
 새걸로 그냥 바꿔드림!
 */


/*
 Swift에선 클로저를 중심으로 다시 생각해볼 수 있습니다.
 */

struct Guest {
    // 두 개의 "() -> Void" 타입의 클로저를 받아 실행하자
    func meetProblem(fix: () -> Void, check: () -> Void) {
        check()
        fix()
    }
}

var tuna: Guest = Guest()

tuna.meetProblem(fix: {
    print("고쳤습니다!")
}, check: {
    print("어서옵쇼!!")
})
/*
 어서옵쇼!!
 고쳤습니다!
 */

tuna.meetProblem {
    print("FIX IT!!")
} check: {
    print("LET ME CHECK IT OUT!!")
}
/*
 LET ME CHECK IT OUT!!
 FIX IT!!
 */
