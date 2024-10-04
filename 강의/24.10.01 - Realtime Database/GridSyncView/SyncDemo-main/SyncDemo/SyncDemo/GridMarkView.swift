//
//  GridMarkView.swift
//  SyncDemo
//
//  Created by Jongwook Park on 3/5/24.
//

import SwiftUI
import FirebaseDatabase

struct GridMarkView: View {
    
    @State private var isOn11: Bool = false
    @State private var isOn12: Bool = false
    @State private var isOn13: Bool = false
    
    @State private var isOn21: Bool = false
    @State private var isOn22: Bool = false
    @State private var isOn23: Bool = false
    
    @State private var isOn31: Bool = false
    @State private var isOn32: Bool = false
    @State private var isOn33: Bool = false
    
    let dbRef = Database.database().reference().child("jamBoard")
    
    var body: some View {
        Grid {
            GridRow {
                Button {
                    isOn11.toggle()
                    dbRef.child("pixel11").setValue(isOn11)
                } label: {
                    HStack {
                        Text(isOn11 ? "O" : "X")
                            .font(.largeTitle)
                    }
                }
                .buttonStyle(.bordered)
                
                
                Button {
                    isOn12.toggle()
                    dbRef.child("pixel12").setValue(isOn12)
                } label: {
                    HStack {
                        Text(isOn12 ? "O" : "X")
                            .font(.largeTitle)
                    }
                }
                .buttonStyle(.bordered)
                
                Button {
                    isOn13.toggle()
                    dbRef.child("pixel13").setValue(isOn13)
                } label: {
                    HStack {
                        Text(isOn13 ? "O" : "X")
                            .font(.largeTitle)
                    }
                }
                .buttonStyle(.bordered)
            }
            
            GridRow {
                Button {
                    isOn21.toggle()
                    dbRef.child("pixel21").setValue(isOn21)
                } label: {
                    HStack {
                        Text(isOn21 ? "O" : "X")
                            .font(.largeTitle)
                    }
                }
                .buttonStyle(.bordered)
                
                
                Button {
                    isOn22.toggle()
                    dbRef.child("pixel22").setValue(isOn22)
                } label: {
                    HStack {
                        Text(isOn22 ? "O" : "X")
                            .font(.largeTitle)
                    }
                }
                .buttonStyle(.bordered)
                
                Button {
                    isOn23.toggle()
                    dbRef.child("pixel23").setValue(isOn23)
                } label: {
                    HStack {
                        Text(isOn23 ? "O" : "X")
                            .font(.largeTitle)
                    }
                }
                .buttonStyle(.bordered)
            }
            
            GridRow {
                Button {
                    isOn31.toggle()
                    dbRef.child("pixel31").setValue(isOn31)
                } label: {
                    HStack {
                        Text(isOn31 ? "O" : "X")
                            .font(.largeTitle)
                    }
                }
                .buttonStyle(.bordered)
                
                
                Button {
                    isOn32.toggle()
                    dbRef.child("pixel32").setValue(isOn32)
                } label: {
                    HStack {
                        Text(isOn32 ? "O" : "X")
                            .font(.largeTitle)
                    }
                }
                .buttonStyle(.bordered)
                
                Button {
                    isOn33.toggle()
                    dbRef.child("pixel33").setValue(isOn33)
                } label: {
                    HStack {
                        Text(isOn33 ? "O" : "X")
                            .font(.largeTitle)
                    }
                }
                .buttonStyle(.bordered)
            }
        }
        .font(.largeTitle)
        .onAppear {
            dbRef.child("pixel11").observe(.value) { snapshot in
                if let value = snapshot.value as? Bool {
                    isOn11 = value
                }
            }
            
            dbRef.child("pixel12").observe(.value) { snapshot in
                if let value = snapshot.value as? Bool {
                    isOn12 = value
                }
            }
            
            dbRef.child("pixel13").observe(.value) { snapshot in
                if let value = snapshot.value as? Bool {
                    isOn13 = value
                }
            }
            
            dbRef.child("pixel21").observe(.value) { snapshot in
                if let value = snapshot.value as? Bool {
                    isOn21 = value
                }
            }
            
            dbRef.child("pixel22").observe(.value) { snapshot in
                if let value = snapshot.value as? Bool {
                    isOn22 = value
                }
            }
            
            dbRef.child("pixel23").observe(.value) { snapshot in
                if let value = snapshot.value as? Bool {
                    isOn23 = value
                }
            }
            
            dbRef.child("pixel31").observe(.value) { snapshot in
                if let value = snapshot.value as? Bool {
                    isOn31 = value
                }
            }
            
            dbRef.child("pixel32").observe(.value) { snapshot in
                if let value = snapshot.value as? Bool {
                    isOn32 = value
                }
            }
            
            dbRef.child("pixel33").observe(.value) { snapshot in
                if let value = snapshot.value as? Bool {
                    isOn33 = value
                }
            }
        }
    }
}

#Preview {
    GridMarkView()
}
