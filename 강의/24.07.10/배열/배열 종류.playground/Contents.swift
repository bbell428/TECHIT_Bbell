import Foundation

//var names: [String] // 타입 이름 : "String 타입의 값들로 채워지는 배열"
//var numbers: [Int] // 타입 이름 : "Int 타입의 값들로 채워지는 배열"
//
//var result1: (Int, String) // 타입 이름 : "Int, String 값들이 순서대로 담기는 튜플"
//var result2: (String, Int) //타입 이름 : "String, Int 값들이 순서대로 담기는 튜플"
//
//var others: [Any] // 타입 이름 : "어떤 타입의 값이라도 채워넣을 수 있는 배열"
//others = [1, 10.34, "안녕하세요"] // Any 타입은 나중에 활용할 때 골치아파요. 가급적 피합시다.


// ------------------------------------------------------------------------------------------------

////  오브젝트 씨
//#import <Foundation/Foundation.h>
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//        
//        // 배열을 만들어봅시다
//        NSArray *names = @[@"Ned", @"Tuna"];
//        
//        // 내용을 바꿀 수 있는 가변형의 배열은 Mutable이라는 이름이 붙은 타입(클래스)가 따로 있어요.
//        NSMutableArray *flexibleNames = [[NSMutableArray alloc] initWithArray:names];
//        [flexibleNames addObject:@"CH"];
//        
//        NSLog(@"%@", flexibleNames);
//        /* 출력 결과
//         (
//             Ned,
//             Tuna,
//             CH
//         )
//         */
//    }
//    return 0;
//}


// ------------------------------------------------------------------------------------------------


//// 배열을 만드는 여러가지 방법
//// 1. 직접 타입 이름 적기 (Type Annotation)
//let names1: [String] = ["Ned", "Tuna"]
//
//let others: [Any] = [1, 3.14, "Hello"]
//
//
//// 2. 타입 추론
//let names2 = ["Ned", "Tuna"]
//
//// [Any] 같은 여러 타입이 한꺼번에 담긴 내용은
//// 타입 추론이 불가능
//// let others = [1, 3.14, "Hello"]
//
//// 빈 배열 만들기
//let names3: Array<String> = []
//
//let names4 = Array<String>()
//let names45 = Array<String>.init()
//
//let names5: [String] = []
//let names6 = [String]()
//let names7 = [String].init()


// ------------------------------------------------------------------------------------------------


//// 빈 배열로 시작하고 내용 채우기.. 귀찮습니다
//var names: [String] = []
//
//for _ in 0..<10 {
//    names.append("Hello")
//}
//
//print(names)
//
//// 그래서 시작할 때부터 채우고 시작합시다
//var filledNames: [String] = [String](repeating: "Hi", count: 100)
//
//print(filledNames)
