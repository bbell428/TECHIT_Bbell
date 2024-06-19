
import SwiftUI

struct SchoolView: View {
    var body: some View {
        List {
            // 학년
            Section("학년") {
                ForEach(mySchool.levels) { level in
                    NavigationLink(" \(level.name) \n \(level.grade)") {
                        
                        SchooClasslView(level: level)
                        
                    }
                }
            }
        }
        .navigationTitle("\(mySchool.name)")
    }
}

#Preview {
    NavigationStack {
        SchoolView()
    }
}
