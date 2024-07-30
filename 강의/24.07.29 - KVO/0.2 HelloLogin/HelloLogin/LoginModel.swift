//
//  LoginModel.swift
//  HelloLogin
//
//  Created by Jongwook Park on 7/29/24.
//

import Foundation

class LoginModel {
    // Singleton 패턴을 적용하기 위해
    // shared라는 타입 인스턴스를 만들어주자
    /*
    static var shared: LoginModel = {
        let instance = LoginModel()
        
        // 인스턴스에 각종 초기 설정을 해줍시다!
        instance.name = "(none)"
        
        return instance
    }()
    */
    
    // 따로 설정 더 해줄 거 없으면 이렇게 간단히도 만들 수 있다
    static let shared: LoginModel = LoginModel()
    
    var name: String = ""
}
