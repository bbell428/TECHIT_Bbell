print(["ABC", "B", "C"].first?.count ?? "-1") // 3
print(Array<String>().last?.count ?? "-1") // -1



struct School {
    var name: String
    var student: [Student] // has-a(포함) 관계
}

struct Student {
    var name: String
    var prize: String
}

var appSchool: School = School(
    name: "앱스쿨: iOS 6기",
    student: [
        Student(name: "Ned", prize: "장학생"),
        Student(name: "Tuna", prize: "개근상"),
    ])

if let name: String = appSchool.student.first?.name {
    print(name)
}
