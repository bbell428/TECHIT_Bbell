//
//  StudentStore.swift
//  Refac
//
//  Created by Jaemin Hong on 9/5/24.
// 

import Foundation
import Observation

@Observable
class StudentStore {
    var students: [Student] = []
    var query: String = ""
    
    init() {
#if DEBUG
        students = [
            Student(labIndex: 1, name: "짱구"),
            Student(labIndex: 1, name: "철수"),
            Student(labIndex: 1, name: "유리"),
            Student(labIndex: 1, name: "맹구"),
            Student(labIndex: 1, name: "훈이"),
            
            Student(labIndex: 2, name: "둘리"),
            Student(labIndex: 2, name: "또치"),
            Student(labIndex: 2, name: "도우너"),
            Student(labIndex: 2, name: "희동이"),
            Student(labIndex: 2, name: "고길동"),
            
            Student(labIndex: 3, name: "마리오"),
            Student(labIndex: 3, name: "루이지"),
            Student(labIndex: 3, name: "와리오"),
            Student(labIndex: 3, name: "요시"),
            Student(labIndex: 3, name: "쿠파"),
            Student(labIndex: 3, name: "피치"),
            
            Student(labIndex: 4, name: "피카츄"),
            Student(labIndex: 4, name: "라이츄"),
            Student(labIndex: 4, name: "파이기"),
            Student(labIndex: 4, name: "꼬부기"),
            Student(labIndex: 4, name: "아보크"),
        ]
#endif
    }
    
    var labIndexes: [Int] {
        var result: Set<Int> = []
        
        for student in students {
            result.insert(student.labIndex)
        }
        
        let resultArray: [Int] = Array(result).sorted()
        
        return resultArray
    }
    
    func studentsForLab(_ index: Int) -> [Student] {
        students.filter {
            if query.isEmpty {
                return true
            } else {
                return $0.name.contains(query)
            }
        }.filter {
            $0.labIndex == index
        }
    }
    
    func shuffle() {
        students.shuffle()
    }
    
    func pick() -> Student? {
        students.randomElement()
    }
    
    func addStudent(labIdnex: Int, name: String) {
        let student = Student(labIndex: labIdnex, name: name)
        students.append(student)
    }
    
    func updateStudent(student: Student, labIdnex: Int, name: String) {
        for (index, target) in students.enumerated() {
            if target.id == student.id {
                students[index].labIndex = labIdnex
                students[index].name = name
            }
        }
    }
}
