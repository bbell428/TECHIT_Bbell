//
//  StudentDetailView.swift
//  Refac
//
//  Created by Jaemin Hong on 9/5/24.
// 

import SwiftUI

struct StudentDetailView: View {
    var studentStore: StudentStore
    var student: Student
    
    @State private var labIndex: Int = 0
    @State private var name: String = ""
    
    @State private var isShowingAlert = false
    
    var body: some View {
        VStack {
            Form {
                Section("Student Info") {
                    Picker("Lab", selection: $labIndex) {
                        ForEach(studentStore.labIndexes, id: \.self) { index in
                            Text("\(index)조")
                                .tag(index)
                        }
                    }
                    
                    HStack {
                        Text("Name")
                        TextField("input a name", text: $name)
                    }
                }
                
                Section {
                    HStack {
                        Spacer()
                        Button("Save") {
                            studentStore.updateStudent(student: student, labIdnex: labIndex, name: name)
                            
                            isShowingAlert.toggle()
                        }
                        .disabled(name.isEmpty)
                        
                        Spacer()
                    }
                }
            }
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("It's updated!"))
        }
        .navigationTitle("Student Info")
        .onAppear {
            labIndex = student.labIndex
            name = student.name
        }
    }
}
