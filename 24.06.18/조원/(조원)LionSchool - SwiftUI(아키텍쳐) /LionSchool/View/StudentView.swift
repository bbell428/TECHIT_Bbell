import SwiftUI

struct StudentView: View {
    let schoolClass: SchoolClass
    
    var body: some View {
        // 학생
        List(schoolClass.students) { student in
            VStack(alignment: .leading) {
                Text("\(student.name)")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding(.bottom, 10)
                Text("MBTI: \(student.mbti)")
                Text("별자리: \(student.star)")
                Text("장기: \(student.talent)")
            }.padding()
        }
        .navigationTitle("\(schoolClass.name)")
        
    }
}

#Preview {
    StudentView(schoolClass: mySchool.levels.first!.schoolClasses.first!)
}
