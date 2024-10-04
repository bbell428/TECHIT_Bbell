//
//  Untitled.swift
//  SyncLight
//
//  Created by Jongwook Park on 10/4/24.
//
import SwiftUI

import FirebaseAuth
import GoogleSignIn

struct AuthView: View {
    @StateObject private var authenticationStore: AuthenticationStore = AuthenticationStore()
    
    @State private var isShowingLoginSheet: Bool = false
    
    var body: some View {
        VStack {
            // 로그인 상태에 따라 보이는 화면을 다르게 함
            switch authenticationStore.authenticationState {
            case .unauthenticated, .authenticating:
                
                VStack {
                    Text("You're not logged in.")
                    
                    Button("Tap here to log in") {
                        authenticationStore.reset()
                        isShowingLoginSheet.toggle()
                    }
                }
                .fullScreenCover(isPresented: $isShowingLoginSheet) {
                    AuthenticationView()
                        .environmentObject(authenticationStore)
                }
                
            case .authenticated:
                VStack {
                    Text("You're logged in as \(authenticationStore.displayName).")
                    
                    Button("log out") {
                        authenticationStore.signOut()
                    }
                }
            }
        }
    }
}

#Preview {
    AuthView()
}
