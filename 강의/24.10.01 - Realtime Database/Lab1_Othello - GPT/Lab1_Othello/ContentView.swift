//
//  ContentView.swift
//  SyncLight
//
//  Created by Jongwook Park on 10/1/24.
//

import SwiftUI
import Firebase

struct ContentView: View {
    let databaseRef = Database.database().reference()  // Firebase Realtime Database 참조
    
    @State private var grid: [[Color]] = Array(repeating: Array(repeating: .red, count: 3), count: 3)
    @State private var currentPlayer: Color = .blue
    @State private var gameFinished: Bool = false
    @State private var blueMoves: [(Int, Int)] = []  // 파란색 돌 위치
    @State private var yellowMoves: [(Int, Int)] = []  // 노란색 돌 위치
    
    var body: some View {
        VStack {
            ForEach(0..<3) { i in
                HStack {
                    ForEach(0..<3) { j in
                        Doll(color: $grid[i][j], action: {
                            if !gameFinished && grid[i][j] == .red {  // 빈 자리일 경우에만 동작
                                grid[i][j] = currentPlayer
                                
                                // 돌 위치 저장
                                if currentPlayer == .blue {
                                    blueMoves.append((i, j))
                                    if blueMoves.count > 3 {  // 3개 초과하면 가장 오래된 돌 삭제
                                        let oldMove = blueMoves.removeFirst()
                                        grid[oldMove.0][oldMove.1] = .red
                                    }
                                    saveMovesToFirebase(moves: blueMoves, player: "blue")
                                } else {
                                    yellowMoves.append((i, j))
                                    if yellowMoves.count > 3 {  // 3개 초과하면 가장 오래된 돌 삭제
                                        let oldMove = yellowMoves.removeFirst()
                                        grid[oldMove.0][oldMove.1] = .red
                                    }
                                    saveMovesToFirebase(moves: yellowMoves, player: "yellow")
                                }
                                
                                if checkWin() {
                                    gameFinished = true
                                    print("\(currentPlayer == .blue ? "Blue" : "Yellow") wins!")
                                } else {
                                    currentPlayer = currentPlayer == .blue ? .yellow : .blue  // 플레이어 전환
                                }
                            }
                        })
                    }
                }
            }
            
            if gameFinished {
                Text("\(currentPlayer == .blue ? "Blue" : "Yellow") Wins!")
                    .font(.title)
                    .padding()
                
                // 리셋 버튼
                Button(action: resetGame) {
                    Text("Reset Game")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .onAppear {
            loadMovesFromFirebase()  // 데이터 불러오기
        }
        .padding()
    }
    
    func checkWin() -> Bool {
        // 가로 체크
        for i in 0..<3 {
            if grid[i][0] != .red && grid[i][0] == grid[i][1] && grid[i][1] == grid[i][2] {
                return true
            }
        }
        
        // 세로 체크
        for i in 0..<3 {
            if grid[0][i] != .red && grid[0][i] == grid[1][i] && grid[1][i] == grid[2][i] {
                return true
            }
        }
        
        // 대각선 체크
        if grid[0][0] != .red && grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2] {
            return true
        }
        if grid[0][2] != .red && grid[0][2] == grid[1][1] && grid[1][1] == grid[2][0] {
            return true
        }
        
        return false
    }
    
    // Firebase에 돌 위치 저장
    func saveMovesToFirebase(moves: [(Int, Int)], player: String) {
        let moveData = moves.map { ["row": $0.0, "col": $0.1] }
        databaseRef.child("omokGame").child(player).setValue(moveData)
    }
    
    // Firebase에서 돌 위치 불러오기
    func loadMovesFromFirebase() {
        databaseRef.child("omokGame").child("blue").observeSingleEvent(of: .value) { snapshot in
            if let moveData = snapshot.value as? [[String: Int]] {
                blueMoves = moveData.compactMap { move in
                    if let row = move["row"], let col = move["col"] {
                        grid[row][col] = .blue  // 돌 위치 복원
                        return (row, col)
                    }
                    return nil
                }
            }
        }
        
        databaseRef.child("omokGame").child("yellow").observeSingleEvent(of: .value) { snapshot in
            if let moveData = snapshot.value as? [[String: Int]] {
                yellowMoves = moveData.compactMap { move in
                    if let row = move["row"], let col = move["col"] {
                        grid[row][col] = .yellow  // 돌 위치 복원
                        return (row, col)
                    }
                    return nil
                }
            }
        }
    }
    
    // 게임 리셋
    func resetGame() {
        grid = Array(repeating: Array(repeating: .red, count: 3), count: 3)
        blueMoves = []
        yellowMoves = []
        currentPlayer = .blue
        gameFinished = false
        
        // Firebase에서 데이터 초기화
        databaseRef.child("omokGame").removeValue()
    }
}

struct Doll: View {
    @Binding var color: Color
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    action()
                }
        }
    }
}

#Preview {
    ContentView()
}
