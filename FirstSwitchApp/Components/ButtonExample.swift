//
//  ButtonExample.swift
//  FirstSwitchApp
//
//  Created by Rafael Romo Muñoz on 01/12/24.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hello, World!") {
            print("Holiwi")
        }
        Button(action: {print("Holiwi")}) {
            Text("Hello")
                .frame(width: 100, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(12)
        }
    }
}

struct Counter: View {
    @State var subsNumber:Int = 0
    var body: some View {
        Button(action: {subsNumber += 1}) {
            Text("Suscriptores: \(subsNumber)")
                .bold()
                .font(.title)
                .frame(height: 50)
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(12)
        }
    }
}

#Preview {
    Counter()
}
