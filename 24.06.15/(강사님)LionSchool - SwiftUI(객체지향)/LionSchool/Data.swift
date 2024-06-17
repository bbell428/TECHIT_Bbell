import Foundation

import Foundation

// 학교 > 학년(~3) > 학급(~8) > 학생(~35)
// School > Level > Class > Student

class School {
    var name: String
    var levels: [Level]
    
    // 초기화 메서드 (클래스에선 필수 구현 항목)
    init(name: String, levels: [Level]) {
        // 초기화에서 받은 값을 내부 값으로 할당한다
        self.name = name
        self.levels = levels
    }
}

// 클래스는 메모리 처리를 이해하면 상수로 선언해도 된다
// let mySchool: School = School(name: "USC")

// Level이 SwiftUI의 List에서 목록으로 하나씩 꺼내어 활용되려면
// Identifiable이라는 프로토콜을 따라야 한다.

class Level: Identifiable {
    // Identifiable 프로토콜을 따르도록 id라는 값을 추가하면서
    // id값은 매번 고유한 난수값으로 담기게 한다.
    var id: UUID = UUID()
    
    var name: String
    var schoolClasses: [SchoolClass]
    
    init(name: String, schoolClasses: [SchoolClass]) {
        self.name = name
        self.schoolClasses = schoolClasses
    }
}

class SchoolClass: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var students: [Student]
    
    init(name: String, students: [Student]) {
        self.name = name
        self.students = students
    }
}

class Student {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// 애니메이션 반 만들기

let animationStudents: [Student] = [
    Student(name: "짱구"),
    Student(name: "도라에몽"),
    Student(name: "흰둥이"),
    Student(name: "큐티니"),
    Student(name: "하니"),
    Student(name: "하츄핑"),
]

let animationClass: SchoolClass = SchoolClass(name: "애니메이션반", students: animationStudents)

// 스포츠 반 만들기
let sportClass: SchoolClass = SchoolClass(name: "스포스반", students: [
    Student(name: "박태환"),
    Student(name: "이상혁"),
    Student(name: "손흥민"),
    Student(name: "김연아"),
    Student(name: "김연경"),
    Student(name: "강호동"),
    Student(name: "장미란"),
])

// 1학년을 만듭시다

let levelOne: Level = Level(name: "1학년", schoolClasses: [animationClass, sportClass])

// 학교를 만듭시다

let mySchool: School = School(name: "멋쟁이고등학교", levels: [
    levelOne,
    Level(name: "2학년", schoolClasses: [
        SchoolClass(name: "배우반", students: [
            Student(name: "변우석"),
            Student(name: "손석구"),
            Student(name: "이채민"),
            Student(name: "김지원"),
            Student(name: "공효진"),
            Student(name: "김지미"),
        ])
    ])
])
