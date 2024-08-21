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
    
    init() {
        // 아래 내용은 시뮬레이터 같은 디버깅 모드일 때만 적용된다. (다른 모드는 Release모드)
        #if DEBUG
        memoList = [
            Memo(text: "Hello World", createdAt: Date()),
            Memo(text: "Good morning", createdAt: Date()),
            Memo(text: "Hi!", createdAt: Date()),
            Memo(text: "동해물과 백두산이 마르고 닳도록", createdAt: Date()),
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
    
    public func memoAdd(_ add: Memo) {
        memoList.append(add)
    }
    
    public func removeMemo(at offset: Int) {
        memoList.remove(at: offset)
    }
}
