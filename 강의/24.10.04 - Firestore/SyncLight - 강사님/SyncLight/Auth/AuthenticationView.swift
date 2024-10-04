//
//  AuthenticationView.swift
//  SyncLight
//
//  Created by Jongwook Park on 10/4/24.
//

import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject var authenticationStore: AuthenticationStore
    
    
    var body: some View {
        VStack {
            switch authenticationStore.flow {
            case .login:
                LoginView()
                    .environmentObject(authenticationStore)
            case .signUp:
                SignupView()
                    .environmentObject(authenticationStore)
            }
        }
    }
}

#Preview {
    AuthenticationView()
        .environmentObject(AuthenticationStore())
}
