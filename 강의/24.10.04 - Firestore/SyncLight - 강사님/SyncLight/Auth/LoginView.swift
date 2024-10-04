//
//  LoginView.swift
//  MyStoreDemo
//
//  Created by Jongwook Park on 3/8/24.
//

import SwiftUI

private enum FocusableField: Hashable {
  case email
  case password
}

struct LoginView: View {
    @EnvironmentObject var authenticationStore: AuthenticationStore
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var focus: FocusableField?
    
    private func signInWithEmailPassword() {
      Task {
        if await authenticationStore.signInWithEmailPassword() == true {
          dismiss()
        }
      }
    }
    
    private func signInWithGoogle() {
      Task {
        if await authenticationStore.signInWithGoogle() == true {
          dismiss()
        }
      }
    }
    
    var body: some View {
        VStack {
          Image("Login")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(minHeight: 300, maxHeight: 400)
          Text("Login")
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)

          HStack {
            Image(systemName: "at")
            TextField("Email", text: $authenticationStore.email)
              .textInputAutocapitalization(.never)
              .disableAutocorrection(true)
              .focused($focus, equals: .email)
              .submitLabel(.next)
              .onSubmit {
                self.focus = .password
              }
          }
          .padding(.vertical, 6)
          .background(Divider(), alignment: .bottom)
          .padding(.bottom, 4)

          HStack {
            Image(systemName: "lock")
            SecureField("Password", text: $authenticationStore.password)
              .focused($focus, equals: .password)
              .submitLabel(.go)
              .onSubmit {
                signInWithEmailPassword()
              }
          }
          .padding(.vertical, 6)
          .background(Divider(), alignment: .bottom)
          .padding(.bottom, 8)

          if !authenticationStore.errorMessage.isEmpty {
            VStack {
              Text(authenticationStore.errorMessage)
                .foregroundColor(Color(UIColor.systemRed))
            }
          }

          Button(action: signInWithEmailPassword) {
            if authenticationStore.authenticationState != .authenticating {
              Text("Login")
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
            }
            else {
              ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
            }
          }
          .disabled(!authenticationStore.isValid)
          .frame(maxWidth: .infinity)
          .buttonStyle(.borderedProminent)

          HStack {
            VStack { Divider() }
            Text("or")
            VStack { Divider() }
          }

          Button(action: signInWithGoogle) {
            Text("Sign in with Google")
              .padding(.vertical, 8)
              .frame(maxWidth: .infinity)
              .background(alignment: .leading) {
                Image("Google")
                  .frame(width: 30, alignment: .center)
              }
          }
          .foregroundColor(colorScheme == .dark ? .white : .black)
          .buttonStyle(.bordered)

          HStack {
            Text("Don't have an account yet?")
            Button(action: { authenticationStore.switchFlow() }) {
              Text("Sign up")
                .fontWeight(.semibold)
                .foregroundColor(.blue)
            }
          }
          .padding([.top, .bottom], 50)

        }
        .listStyle(.plain)
        .padding()
      }
}

#Preview {
    LoginView()
        .environmentObject(AuthenticationStore())
}
