import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("\(mySchool.campaign)")
                }
                // 학년
                Section {
                    ForEach(mySchool.levels) { level in
                        NavigationLink(" \(level.name) \n \(level.grade)") {
                            
                            //학급
                            List(level.schoolClasses) { schoolClass in
                                NavigationLink(" \(schoolClass.name) \n \(schoolClass.campaign)") {
                                    
                                    // 학생
                                    List(schoolClass.students) { student in
                                        VStack(alignment: .leading, spacing: 20) {
                                            Text("\(student.name)")
                                                .font(.title)
                                                .foregroundColor(.blue)
//                                                .padding(.bottom, 10)
                                            Text("MBTI: \(student.mbti)")
                                            Text("별자리: \(student.star)")
                                            Text("장기: \(student.talent)")
                                        }.padding()
                                    }
                                    .navigationTitle("\(schoolClass.name)")
                                }
                            }
                            .navigationTitle("\(level.name)")
                            
                        }
                    }
                }
            }
            .navigationTitle("\(mySchool.name)")
        }
        .font(.title2)
    }
}

#Preview {
    ContentView()
}
