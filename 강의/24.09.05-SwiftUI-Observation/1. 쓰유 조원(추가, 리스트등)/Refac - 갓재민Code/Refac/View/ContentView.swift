//
//  ContentView.swift
//  Refac
//
//  Created by Jaemin Hong on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    @Bindable var studentStore = StudentStore()
    
    @State private var isShowingAlert = false
    @State private var isShowingSheet = false
    
    @State private var selectedLabIndex: Int = -1
    
    @State private var addingLabIndex: Int = 0
    @State private var addingName: String = ""
    
    
    var labsForDisplay: [Int] {
        if selectedLabIndex < 0 {
            return studentStore.labIndexes
        } else {
            return [selectedLabIndex]
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                
                SearchFieldView(query: $studentStore.query)
                
                Divider()
                
                ScrollView(.horizontal) {
                    HStack {
                        Rectangle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(.clear)
                        
                        DisplayFilterButton("전체") {
                            selectedLabIndex = -1
                        } select: {
                            selectedLabIndex < 0
                        }
                        
                        ForEach(studentStore.labIndexes, id: \.self) { index in
                            DisplayFilterButton("\(index)조") {
                                if selectedLabIndex == index {
                                    selectedLabIndex = -1
                                } else {
                                    selectedLabIndex = index
                                }
                            } select: {
                                selectedLabIndex == index
                            }
                        }
                    }
                }
                
                List {
                    ForEach(labsForDisplay, id: \.self) { index in
                        Section("\(index)조") {
                            ForEach(studentStore.studentsForLab(index)) { student in
                                NavigationLink {
                                    StudentDetailView(studentStore: studentStore, student: student)
                                } label: {
                                    Text(student.name)
                                }
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        studentStore.shuffle()
                    } label: {
                        Label("Shuffle", systemImage: "shuffle")
                    }
                    
                    
                    Spacer()
                    
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Label("Add", systemImage: "person.crop.circle.fill.badge.plus")
                    }
                    
                    Spacer()
                    
                    
                    Button {
                        isShowingAlert.toggle()
                    } label: {
                        Label("Pick", systemImage: "scope")
                    }
                    
                    Spacer()
                }
            }
            .listStyle(.plain)
            .navigationTitle("Students")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("\(studentStore.pick()?.name ?? "") is winner!"))
            }
            .sheet(isPresented: $isShowingSheet) {
                NavigationStack {
                    VStack {
                        
                        Form {
                            Section("Student Info") {
                                Picker("Lab", selection: $addingLabIndex) {
                                    ForEach(studentStore.labIndexes, id: \.self) { index in
                                        Text("\(index)조")
                                            .tag(index)
                                    }
                                }
                                
                                HStack {
                                    Text("Name")
                                    TextField("input a name", text: $addingName)
                                }
                            }
                        }
                        
                    }
                    .navigationTitle("Add a student")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Cancel") {
                                isShowingSheet.toggle()
                            }
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Save") {
                                studentStore.addStudent(labIdnex: addingLabIndex, name: addingName)
                                isShowingSheet.toggle()
                            }
                            .disabled(addingName.isEmpty)
                        }
                    }
                    .onAppear {
                        addingLabIndex = studentStore.labIndexes.first ?? 0
                        addingName = ""
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
