import Foundation

// 파일 전송의 문제되는 상황들을 정리해봅시다
enum FileTransferError: Error {
    case noConnection   // 인터넷 끊김
    case lowBandwidth   // 인터넷 너무 느림
    case fileNotFound   // 해당 파일 없음
}

// 각종 외부의 상황을 가상으로 준비해봅시다
let connectionOK: Bool = true
let connectionSpeed: Double = 30.0
let fileFound: Bool = false

// 파일 전송을 시킬 함수를 만들어봅시다
// 파일 전송중에 문제가 발생할 수도 있음을 선언부에 씁시다
func transferFile() throws {
    
    // 인터넷 연결이 끊겼는가?
    guard connectionOK else {
        throw FileTransferError.noConnection
        // 위 에러 던지기로 함수 종료
    }
    
    // 인터넷이 너무 느린가?
    guard connectionSpeed > 30.0 else {
        throw FileTransferError.lowBandwidth
    }
    
    // 파일이 없는가?
    guard fileFound else {
        throw FileTransferError.fileNotFound
    }
    
    // 그럼 문제없으니까 파일 전송!
    print("파일전송....성공!")
}

// 파일전송 진행시켜봅시다!
// 고객과 싸울 일만 남았습니다
do {
    try transferFile()
} catch {
    print("다 미안해. 암튼 다 미안해.")
}

// 파일전송 진행시켜봅시다!
do {
    try transferFile()
} catch FileTransferError.noConnection {
    print("네트워크 연결이 필요합니다")
} catch FileTransferError.lowBandwidth {
    print("네트워크 연결이 월할하지 않습니다")
} catch FileTransferError.fileNotFound {
    print("전송할 파일을 찾지 못했습니다")
} catch {
    print("다 미안해. 암튼 다 미안해.")
}

// 파일전송 진행시켜봅시다!
// 얼렁뚱땅 넘어가는 구석도 만들 수 있어요
do {
    try transferFile()
    
} catch FileTransferError.noConnection, FileTransferError.lowBandwidth {
    print("네트워크 어딘가 문제가 생겼는데요, 암튼 네트워크 문제에요...")
} catch FileTransferError.fileNotFound {
    print("전송할 파일을 찾지 못했습니다")
} catch {
    print("다 미안해. 암튼 다 미안해.")
}
