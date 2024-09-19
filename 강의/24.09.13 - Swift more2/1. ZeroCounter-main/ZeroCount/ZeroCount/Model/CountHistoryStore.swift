//
//  CountHistoryStore.swift
//  ZeroCount
//
//  Created by Jongwook Park on 2/5/24.
//

import Foundation
import Observation

@Observable
class CountHistoryStore {
    var countHistoryList: [CountHistory] = []
    
    init() {
        // 검증을 위한 코드
        /*
        countHistoryList = [
            CountHistory(count: 12),
            CountHistory(count: 32),
            CountHistory(count: 53),
        ]
        
        saveData()
        */
        
        // 다음의 코드를 사용하면
        // 화면마다 onAppear에서 fetchData() 호출이 필요없다
        // 그러나 동기화 관점에서 문제가 생길 수 있다
        // fetchData()
    }

    // UserDefaults에서 읽어오기
    private func loadData() {
        if let encoded = UserDefaults.standard.data(forKey: "countHistoryList") {
            
            // UserDefaults에서 읽어오는 데이터는 Decoding이 필요하다
            let decoder: JSONDecoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([CountHistory].self, from: encoded) {
                countHistoryList = decoded
            }
        }
    }
    
    // UserDefaults에 저장하기
    private func saveData() {
        // UserDefaults에 저장할 데이터는 Encoding이 필요하다
        let encoder: JSONEncoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(countHistoryList) {
            UserDefaults.standard.setValue(encoded, forKey: "countHistoryList")
        }
    }
    
    func fetchData() {
        loadData()
    }
    
    func addData(count: Int) {
        // 새로운 데이터 추가하기
        let countHistory = CountHistory(count: count)
        countHistoryList.append(countHistory)
        
        // 현재 상태 UserDefaults에 저장하기
        saveData()
    }
    
    func deleteData(at offsets: IndexSet) {
        // 데이터 삭제하기
        countHistoryList.remove(atOffsets: offsets)
        
        // 현재 상태 UserDefaults에 저장하기
        saveData()
    }
    
    // 전체 삭제를 위한 메서드
    func deleteDataAll() {
        countHistoryList.removeAll()
        saveData()
    }
}
