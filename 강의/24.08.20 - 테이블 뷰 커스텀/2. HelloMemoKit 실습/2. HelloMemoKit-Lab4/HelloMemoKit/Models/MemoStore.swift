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
            Memo(text: "Hello!", createdAt: Date()),       // 미국
            Memo(text: "Hola!", createdAt: Date()),        // 스페인
            Memo(text: "Bonjour!", createdAt: Date()),     // 프랑스
            Memo(text: "Hallo!", createdAt: Date()),       // 독일
            Memo(text: "Ciao!", createdAt: Date()),        // 이탈리아
            Memo(text: "Konnichiwa!", createdAt: Date()),  // 일본
            Memo(text: "Nǐ hǎo!", createdAt: Date()),      // 중국
            Memo(text: "Annyeong!", createdAt: Date()),    // 한국
        ]
#endif
    }
}
