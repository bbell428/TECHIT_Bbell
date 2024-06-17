//
//  Data.swift
//  LionSchool
//
//  Created by 이소영 on 6/17/24.
//

import Foundation

class School {
    var name: String
    var levels: [Level]
    // 초기화 메서드 (클래스에선 필수 구현 항목)
    init(name: String, levels: [Level]) {
        //초기화에서 받은 값을 내부 값으로 할당한다
        self.name = name
        self.levels = levels
    }
}

// 클래스는 메모리 처리를 이해하면 상수로 선언해도 된다
//let mySchool: School = School(name: "USC")

//Level이 SwiftUI의 List에서 목록으로 하나씩 꺼내어 활용되려면
//Identifiable이라는 프로토콜을 따라야 한다
class Level: Identifiable {
    // Identifiable 프로토콜을 따르도록 id라는 값을 추가하면서
    //id값은 매번 고유한 난수 값으로 담기게 한다
    var id: UUID = UUID()
    
    var name: String
    var schoolClasses: [SchoolClass]
    init(name: String, schoolClasses: [SchoolClass]) {
        //초기화에서 받은 값을 내부 값으로 할당한다
        self.name = name
        self.schoolClasses = schoolClasses
    }
}

class SchoolClass: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var students: [Student]
    init(name: String, students: [Student]) {
        //초기화에서 받은 값을 내부 값으로 할당한다
        self.name = name
        self.students = students
    }
}

class Student: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    init(name: String) {
        //초기화에서 받은 값을 내부 값으로 할당한다
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
    Student(name: "하츄핑")
]

//1학년
let animationClass: SchoolClass = SchoolClass(name: "애니메이션반", students: animationStudents)

let sportClass: SchoolClass = SchoolClass(name: "스포츠반", students: [
    Student(name: "박태환"),
    Student(name: "이상혁"),
    Student(name: "손흥민"),
    Student(name: "김연아"),
    Student(name: "김연경"),
    Student(name: "강호동"),
    Student(name: "장미란")
])

let singerClass: SchoolClass = SchoolClass(name: "가수반", students: [
    Student(name: "아이유"),
    Student(name: "태연"),
    Student(name: "로제"),
    Student(name: "벤"),
    Student(name: "박효신"),
    Student(name: "임창정")
])

//2학년
let actorClass: SchoolClass = SchoolClass(name: "배우반", students: [
        Student(name: "변우석"),
        Student(name: "손석구"),
        Student(name: "이채민"),
        Student(name: "김지원"),
        Student(name: "공효진"),
        Student(name: "김지미")
    ])

let rapperClass: SchoolClass = SchoolClass(name: "가수반", students: [
    Student(name: "아이유"),
    Student(name: "태연"),
    Student(name: "로제"),
    Student(name: "벤"),
    Student(name: "박효신"),
    Student(name: "임창정")
])

let multiClass: SchoolClass = SchoolClass(name: "다국적반", students: [
    Student(name: "탕웨이"),
    Student(name: "아이묭"),
    Student(name: "박보검"),
    Student(name: "톰크루즈"),
    Student(name: "엠마왓슨"),
])

//3학년
let scientistClass: SchoolClass = SchoolClass(name: "과학반", students: [
        Student(name: "아리스토텔레스"),
        Student(name: "에디슨"),
        Student(name: "갈릴레오갈릴레이"),
        Student(name: "마리퀴리"),
        Student(name: "찰스다윈"),
    ])

let artistClass: SchoolClass = SchoolClass(name: "미술반", students: [
    Student(name: "반고흐"),
    Student(name: "다빈치"),
    Student(name: "뭉크"),
    Student(name: "피카소"),
    Student(name: "미켈란젤로")
])

let funClass: SchoolClass = SchoolClass(name: "예능반", students: [
    Student(name: "유재석"),
    Student(name: "박명수"),
    Student(name: "이은지"),
    Student(name: "지예은"),
    Student(name: "신동엽")
])

//학년을 만듭시다
let levelOne: Level = Level(name: "1학년", schoolClasses: [animationClass, sportClass, singerClass])
let levelTwo: Level = Level(name: "2학년", schoolClasses: [actorClass, rapperClass, multiClass])
let levelThree: Level = Level(name: "3학년", schoolClasses: [scientistClass, artistClass, funClass])

// 학교를 만듭시다
let mySchool: School = School(name: "멋쟁이고등학교", levels: [levelOne, levelTwo, levelThree])
