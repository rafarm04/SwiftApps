//
//  TextExample.swift
//  FirstSwitchApp
//
//  Created by Rafael Romo Muñoz on 30/11/24.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.headline)
            Text("Custom").font(.system(size: 40, weight: .light, design: .monospaced))
                .italic()
                .bold()
                .underline()
                .foregroundColor(.blue)
                .background(.red)
            Text("Aris Aris Aris Aris Aris")
                .frame(width: 50)
                .lineLimit(2) // limit of lines
                .lineSpacing(125) // space between lines
        }
    }
}

#Preview {
    TextExample()
}
