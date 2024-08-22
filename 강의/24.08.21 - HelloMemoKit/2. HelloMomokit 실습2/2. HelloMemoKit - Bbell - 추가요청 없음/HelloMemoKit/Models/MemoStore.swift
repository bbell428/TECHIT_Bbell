//
//  MemoStore.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import Foundation

final class MemoStore {
    // Singleton 인스턴스
    public static let shared = MemoStore()
    
    private(set) var memoList: [Memo] = []
    
    // 필터링된 목록
    public var filteredMemoList: [Memo] = []
    
    init() {
        // 아래 내용은 시뮬레이터 같은 디버깅 모드일 때만 적용된다. (다른 모드는 Release모드)
#if DEBUG
        memoList = [
            Memo(text: "Hello World", createdAt: Date()),
            Memo(text: "Good morning", createdAt: Date()),
            Memo(text: "Hi!", createdAt: Date()),
            Memo(text: "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세", createdAt: Date()),
            Memo(text: "하느님이 보우하사 우리나라 만세", createdAt: Date()),
            Memo(text: "무궁화 삼천리 화려강산", createdAt: Date()),
            Memo(text: "대한사람 대한으로 길이 보전하세", createdAt: Date()),
            Memo(text: "남산 위에 저 소나무 철갑을 두른듯", createdAt: Date()),
            Memo(text: "바람서리 불변함은 우리 기상일세", createdAt: Date()),
            Memo(text: "무궁화 삼천리 화려강산", createdAt: Date()),
            Memo(text: "대한사람 대한으로 길이 보전하세", createdAt: Date()),
        ]
#endif
    }
    
    private func sortMemos() {
        memoList.sort(by: { $0.createdAt > $1.createdAt })
        filteredMemoList = memoList
    }
    
    public func addMemo(_ text: String) {
        let memo = Memo(text: text, createdAt: Date())
        memoList.append(memo)
        filteredMemoList.append(memo)
        
        sortMemos()
    }
    
    public func removeMemo(at id: UUID) {
        
        // memoList에서 해당 메모 삭제
        memoList.removeAll { $0.id == id }
        
        // filteredMemoList에서 해당 메모 삭제
        filteredMemoList.removeAll { $0.id == id }
    }
    
    // MARK: - 검색 필터링
    
    public func filterMemos(searchText: String) {
        if searchText.isEmpty {
            sortMemos()
        } else {
            filteredMemoList = memoList.filter { memo in
                memo.text.localizedCaseInsensitiveContains(searchText)
            }
            
        }
    }
}
