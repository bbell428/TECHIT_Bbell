// 이 경우
// School과 Student가 서로를 참조하는 관계
// "참조 사이클이 발생한다"

class School {
    var name: String = ""
    var students: [Student?] = []
}

class Student {
    var name: String = ""
    var school: School? // 학생은 학교를 선택할 수도 있고, 전학갈 수도 있으니까
}

var appSchool: School? = School()
appSchool?.name = "앱스쿨"

var backendSchool: School? = School()
backendSchool?.name = "백앤드스쿨"

var ned: Student? = Student()
ned?.name = "Ned Park"

// 서로 참조하는 강한 참조 사이클 발생
ned?.school = appSchool // 학생은 자기 스쿨을 앱스쿨이라 생각하고
appSchool?.students = [ned] // 앱스쿨은 ned를 자기 학생이라 생각한다

appSchool = nil // 만약 앱스쿨이 종강한다면?
// 또는
ned?.school = nil // 만약 학생이 앱스쿨을 안타깝게도 떠난다면?
