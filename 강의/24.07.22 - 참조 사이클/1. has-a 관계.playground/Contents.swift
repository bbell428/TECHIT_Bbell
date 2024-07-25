// 이 경우
// School은 Student를 포함하고 있다(has-a)관계라고 말한다

class School {
    var name: String = ""
    var students: [Student] = []
}

class Student {
    var name: String = ""
}
