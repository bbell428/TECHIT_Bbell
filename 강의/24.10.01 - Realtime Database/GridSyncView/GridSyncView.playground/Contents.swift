//
//  GridSyncView.swift
//  SyncLight
//
//  Created by Jongwook Park on 10/1/24.
//

import SwiftUI
import Firebase

enum Mode: Int {
    case blank = 0
    case white = 1
    case black = 2
}

struct GridSyncView: View {
    @State private var mode: Mode = .white
    
    @State private var cells: [String: Mode] = [:]
    
    let databaseRef = Database.database().reference()
    
    var body: some View {
        VStack {
            Picker("Mode", selection: $mode) {
                Text("blank").tag(Mode.blank)
                Text("white").tag(Mode.white)
                Text("black").tag(Mode.black)
            }
            
            Grid {
                ForEach(0...2, id: \.self) { row in
                    GridRow {
                        ForEach(0...2, id: \.self) { column in
                            Button {
                                cells["\(row)\(column)"] = mode
                                
                                databaseRef.child("cell\(row)\(column)").setValue(mode.rawValue)
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .fill(Color.green)
                                    if let cell = cells["\(row)\(column)"] {
                                        switch cell {
                                        case .blank:
                                            Circle().fill(Color.clear)
                                        case .white:
                                            Circle().fill(Color.white)
                                        case .black:
                                            Circle().fill(Color.black)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            cells["00"] = .blank
            cells["01"] = .blank
            cells["02"] = .blank
            
            cells["10"] = .blank
            cells["11"] = .blank
            cells["12"] = .blank
        
            cells["20"] = .blank
            cells["21"] = .blank
            cells["22"] = .blank
            
            for row in 0...2 {
                for column in 0...2 {
                    databaseRef.child("cell\(row)\(column)").observe(.value) { snapshot in
                        
                        if let value = snapshot.value as? Int {
                            switch value {
                            case 0:
                                cells["\(row)\(column)"] = .blank
                            case 1:
                                cells["\(row)\(column)"] = .white
                            case 2:
                                cells["\(row)\(column)"] = .black
                            default:
                                break
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GridSyncView()
}
