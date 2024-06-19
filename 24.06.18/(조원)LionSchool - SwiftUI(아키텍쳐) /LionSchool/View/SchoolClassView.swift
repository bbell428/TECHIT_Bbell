import SwiftUI

struct SchooClasslView: View {
    let level: Level
    
    var body: some View {
        
        //학급
        List(level.schoolClasses) { schoolClass in
            NavigationLink(" \(schoolClass.name) \n \(schoolClass.campaign)") {
                
                StudentView(schoolClass: schoolClass)
                
            }
        }
        .navigationTitle("\(level.name)")
    }
}


#Preview {
    NavigationStack {
        SchooClasslView(level: mySchool.levels.first!)
    }
}
