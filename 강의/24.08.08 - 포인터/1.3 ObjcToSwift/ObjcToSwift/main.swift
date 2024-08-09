//
//  main.swift
//  ObjcToSwift
//
//  Created by 김종혁 on 8/8/24.
//

import Foundation

class Person {
    var personName: String
    var personAge: Int
    
    func prints() {
        print("Name: \(personName)")
        print("Age: \(personAge)")
    }
 
    init(personName: String, personAge: Int) {
        self.personName = personName
        self.personAge = personAge
    }
}

class Employee: Person {
    var employeeEducation: String
    
    override func prints() {
        print("Name: \(personName)")
        print("Age: \(personAge)")
        print("Education: \(employeeEducation)")
    }
    
    init(personName: String, personAge: Int, employeeEducation: String) {
        self.employeeEducation = employeeEducation
        
        super.init(personName: personName, personAge: personAge)
    }
}

print("Base class Person Object")
var person: Person = Person(personName: "Raj", personAge: 5)
person.prints()

print("-------------------------------------------")

print("Inherited Class Employee Object")
var employee: Employee = Employee(personName: "Raj", personAge: 5, employeeEducation: "MBA")
employee.prints()
