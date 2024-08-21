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
    
    var memoList: [Memo] = []
    
    init() {
        // 아래 내용은 시뮬레이터 같은 디버깅 모드일 때만 적용된다. (다른 모드는 Release모드)
        #if DEBUG
        memoList = [
            Memo(text: "Hello World", createdAt: Date()),
            Memo(text: "Good morning", createdAt: Date()),
            Memo(text: "Hi!", createdAt: Date()),
        ]
        #endif
    }
}
