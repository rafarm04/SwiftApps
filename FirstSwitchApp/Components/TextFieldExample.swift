//
//  TextFieldExample.swift
//  FirstSwitchApp
//
//  Created by Rafael Romo Muñoz on 01/12/24.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            TextField("Write your email here", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: email) { oldValue, newValue in
                    print("Las value was: \(oldValue), and the new value is: \(newValue)")
                }
            //Password
            SecureField("Write your password here", text: $password)
                .keyboardType(.default)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: password) { oldValue, newValue in
                    print("Las value was: \(oldValue), and the new value is: \(newValue)")
                }
        }
    }
}

#Preview {
    TextFieldExample()
}
