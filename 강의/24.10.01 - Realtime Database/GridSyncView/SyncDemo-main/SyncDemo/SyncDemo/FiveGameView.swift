//
//  FiveGameView.swift
//  SyncDemo
//
//  Created by Jongwook Park on 3/5/24.
//

import SwiftUI
import FirebaseDatabase

enum Pixel: Int {
    case none = 0
    case black
    case white
}

struct History {
    var row: Int
    var column: Int
    var pixel: Pixel
}

let gamePixels: Int = 9
let winnerContition: Int = 5

struct FiveGameView: View {
    
    @State private var history: [History] = []
    @State private var isBlackPlayer: Bool = true
    @State private var result: String = "...ing"
        
    private var isBlackTurn: Bool {
        (history.count % 2) == 0
    }
    
    private var currentTurnPixel: Pixel {
        isBlackTurn ? .black : .white
    }
    
    private var currentTurnTitle: String {
        isBlackTurn ? "black" : "white"
    }
    
    private var gameTable: [[Pixel]] {
        var table: [[Pixel]] = Array(repeating: Array(repeating: .none, count: gamePixels), count: gamePixels)
        
        history.forEach { history in
            table[history.row][history.column] = history.pixel
        }
        
        return table
    }
    
    var body: some View {
        VStack {
            
            Toggle("Player Black", isOn: $isBlackPlayer)
                .padding()
            
            HStack {
                Text("turn : \(currentTurnTitle)")
                Text("|")
                Text("result : \(result)")
            }
                .padding()
            
            VStack {
                ForEach(Array(gameTable.enumerated()), id:\.offset) { row, rowPixels in
                    HStack {
                        ForEach(Array(rowPixels.enumerated()), id:\.offset) { column, pixel in
                            Button {
                                addHistory(row: row, column: column)
                            } label: {
                                ZStack {
                                    switch pixel {
                                    case .none:
                                        Text("+")
                                        Image(systemName: "circle")
                                            .opacity(0)
                                    case .black:
                                        Image(systemName: "circle.fill")
                                    case .white:
                                        Image(systemName: "circle")
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            HStack {
                Spacer()
                Button {
                    undoHistory()
                } label: {
                    Label("Undo", systemImage: "arrow.uturn.backward")
                }
                Spacer()
                Button {
                    resetHistory()
                } label: {
                    Label("Reset", systemImage: "flame.fill")
                }
                Spacer()
            }
            .padding()
        }
        .onAppear {
            startWatchingDatabase()
        }
    }
    
    private func addHistory(row: Int, column: Int) {
        print("\(row)-\(column) turn:\(isBlackTurn) player:\(isBlackPlayer) color:\(currentTurnPixel)")
        
        let pixel = gameTable[row][column]
        
        if (pixel == .none) && (isBlackTurn == isBlackPlayer) {
            let currentHistory = History(row: row, column: column, pixel: currentTurnPixel)
            history.append(currentHistory)
            updateDatabase()
        }
    }
    
    private func undoHistory() {
        if !history.isEmpty {
            history.removeLast()
            updateDatabase()
        }
    }
    
    private func resetHistory() {
        history.removeAll()
        updateDatabase()
    }
    
    private func updateDatabase() {
        let dbRef = Database.database().reference().child("gameTable")
        
        var dbHistory:[[String: Int]] = []
        
        for data in history {
            var dbData: [String: Int] = [:]
            dbData["row"] = data.row
            dbData["column"] = data.column
            dbData["color"] = data.pixel.rawValue
            dbHistory.append(dbData)
        }
        
        dbRef.setValue(dbHistory)
    }
    
    private func startWatchingDatabase() {
                
        let dbRef = Database.database().reference().child("gameTable")
        
        dbRef.observe(.value) { snapshot in
            
            history.removeAll()
            
            if let dbHistory = snapshot.value as? [[String: Int]] {
//                print("\(dbHistory)")
                
                for data in dbHistory {
                    let row: Int = data["row"] ?? 0
                    let column: Int = data["column"] ?? 0
                    let pixel: Pixel = (data["color"] == 1 ? .black : .white) ?? .none
                    let data: History = History(row: row, column: column, pixel: pixel)
                    history.append(data)
                }
                
                dbRef.setValue(dbHistory)
                
                calcWinnter()
            }
        }
    }
    
    private func calcWinnter() {
        
        result = "...ing"
        
        let start: Int = Int(winnerContition / 2) // 2
        let end: Int = gamePixels - Int(winnerContition / 2) // 7
        
        print("[ start: \(start) / end: \(end) ]")
        
        // 수직 비교
        for row in start..<end {
            for column in 0..<gamePixels {
                let center: Pixel = gameTable[row][column]
                
                if center != .none {
                    print("[수직비교 확인된 돌 \(row) | \(column) | \(center)]")
                    
                    var isWinner: Bool = true
                    
                    for y in -2 ... 2 {
                        if gameTable[row + y][column] == center {
                            print("| 수직 비교대상 \(row + y) | \(column) | \(center)!")
                        } else {
                            isWinner = false
                            break
                        }
                    }
                    
                    if isWinner {
                        result = "\(center) win"
                        return
                    }
                }
            }
        }
        
        // 수평 비교
        for row in 0..<gamePixels {
            for column in start..<end {
                let center: Pixel = gameTable[row][column]
                
                if center != .none {
                    print("[수평비교 확인된 돌 \(row) | \(column) | \(center)]")
                    
                    var isWinner: Bool = true
                    
                    for x in -2 ... 2 {
                        if gameTable[row][column + x] == center {
                            print("- 수평 비교대상 \(row) | \(column + x) | \(center)!")
                        } else {
                            isWinner = false
                            break
                        }
                    }
                    
                    if isWinner {
                        result = "\(center) win"
                        return
                    }
                }
            }
        }
        
        // 좌상단-우하단 비교(\)
        for row in start..<end {
            for column in start..<end {
                let center: Pixel = gameTable[row][column]
                
                if center != .none {
                    print("[좌상단-우하단 확인된 돌 \(row) | \(column) | \(center)]")
                    
                    var isWinner: Bool = true
                    
                    for xy in -2 ... 2 {
                        if gameTable[row + xy][column + xy] == center {
                            print("\\ 좌상단-우하단 비교대상 \(row + xy) | \(column + xy) | \(center)!")
                        } else {
                            isWinner = false
                            break
                        }
                    }
                    
                    if isWinner {
                        result = "\(center) win"
                        return
                    }
                }
            }
        }
        
        // 우상단-좌하단 비교(/)
        for row in start..<end {
            for column in start..<end {
                let center: Pixel = gameTable[row][column]
                
                if center != .none {
                    print("[우상단-좌하단 확인된 돌 \(row) | \(column) | \(center)]")
                    
                    var isWinner: Bool = true
                    
                    for xy in -2 ... 2 {
                        if gameTable[row + xy][column - xy] == center {
                            print("/ 우상단-좌하단 비교대상 \(row + xy) | \(column + xy) | \(center)!")
                        } else {
                            isWinner = false
                            break
                        }
                    }
                    
                    if isWinner {
                        result = "\(center) win"
                        return
                    }
                }
            }
        }
    }
}

#Preview {
    FiveGameView()
}
