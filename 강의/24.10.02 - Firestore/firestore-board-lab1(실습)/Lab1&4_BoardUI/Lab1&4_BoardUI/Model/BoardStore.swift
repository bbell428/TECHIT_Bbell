//
//  BoardStore.swift
//  Lab1&4_BoardUI
//
//  Created by 박준영 on 10/2/24.
//

import Foundation
import Observation
import SwiftUI
import FirebaseCore
import FirebaseFirestore

@Observable
class BoardStore {
    var boards: [Board] = []
    
    var boardDataSorted: [Board] {
        get {
            boards.sorted {
                $0.date > $1.date
            }
        }
    }
    
    static var sampleBoarder: Board {
        Board(id: "\(UUID())", date: Date(), nickName: "테스트", text: "안녕하세요", heart: 99, comment: ["ㅎㅇ", "반갑습니다."])
    }
    
    private func loadBoards() async {
        // Firebase의 Cloud Firestore에서 읽기
        do {
            let db = Firestore.firestore()
            let snapshots = try await db.collection("Board").getDocuments()
            
            var savedBoards: [Board] = []
            
            for document in snapshots.documents {
                // let id: String = document.documentID
                
                let docData = document.data()
                let id = document.documentID
                let timestamp = docData["date"] as? Timestamp
                let date = timestamp?.dateValue() ?? Date()
                
                let heart: Int = docData["heart"] as? Int ?? 0
                let nickName: String = docData["nickname"] as? String ?? ""
                let text: String = docData["text"] as? String ?? ""
                let comment: [String] = docData["comment"] as? [String] ?? []
                
                let boarder: Board = Board(id: id, date: date, nickName: nickName, text: text, heart: heart, comment: comment)
                savedBoards.append(boarder)
            }
            
            boards = savedBoards
            print(boards)
            
        } catch {
            print("Error getting documents: \(error)")
        }
    }
    
    func addBoard(text: String, nickname: String) {
        // 게시글 추가하기
        guard !text.isEmpty else {
            return
        }

        let boarder = Board(id: "\(UUID())", date: Date(), nickName: nickname, text: text, heart: 0, comment: [])
        boards.append(boarder)
        
        Task {
            do {
                let db = Firestore.firestore()
                try await db.collection("Board").document("\(boarder.id)").setData([
                    "nickname": boarder.nickName,
                    "text": boarder.text,
                    "date": Date(),
                    "heart": boarder.heart,
                    "comment": boarder.comment
                  ])
                
                print("Document successfully written!")
            } catch {
                print("Error writing document: \(error)")
            }
        }
    }
    
    func updateBoard(board: Board) {
        // 게시글 수정하기
        Task {
            do {
                let db = Firestore.firestore()
                try await db.collection("Board").document("\(board.id)").updateData([
                    "nickname": board.nickName,
                    "text": board.text,
                    "date": board.date,
                    "heart": board.heart,
                    "comment": board.comment
                  ])
                
                print("Document successfully fix!")
            } catch {
                print("Error fix document: \(error)")
            }
        }
        
        var index: Int = 0
        
        for boardList in boards {
            
            if boardList.id == board.id {
                boards.remove(at: index)
                let boarder = Board(id: board.id, date: board.date, nickName: board.nickName, text: board.text, heart: board.heart, comment: board.comment)
                boards.append(boarder)
                break
            }
            
            index += 1
        }
    }
    
    func updateHeart(board: Board) {
        // 게시글 하트 받기
        Task {
            do {
                let db = Firestore.firestore()
                try await db.collection("Board").document("\(board.id)").updateData([
                    "nickname": board.nickName,
                    "text": board.text,
                    "date": board.date,
                    "heart": board.heart,
                    "comment": board.comment
                  ])
                
                print("Document successfully written!")
            } catch {
                print("Error writing document: \(error)")
            }
        }
        
        var index: Int = 0
        
        for boardList in boards {
            
            if boardList.id == board.id {
                boards.remove(at: index)
                let boarder = Board(id: board.id, date: board.date, nickName: board.nickName, text: board.text, heart: board.heart, comment: board.comment)
                boards.append(boarder)
                break
            }
            
            index += 1
        }
    }
    
    func removeBoard(_ board: Board) {
        // 게시글 삭제
        Task {
            do {
                let db = Firestore.firestore()
                try await db.collection("Board").document("\(board.id)").delete()
                print("Document successfully removed!")
            } catch {
                print("Error writing document: \(error)")
            }
        }
        
        var index: Int = 0
        
        for boardList in boards {
            
            if boardList.id == board.id {
                boards.remove(at: index)
                break
            }
            
            index += 1
        }
    }
    
    func fetchBoards() async {
        await loadBoards()
    }
}
