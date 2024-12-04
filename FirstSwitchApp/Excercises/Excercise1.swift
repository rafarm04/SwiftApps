//
//  ContentView.swift
//  FirstSwitchApp
//
//  Created by Rafael Romo Muñoz on 29/11/24.
//

import SwiftUI

struct Excercise1: View {
    var body: some View {
        //vertical stack
        //VStack
        //horizontal stack
        /*First excercise, create an image using stacks*/
        VStack{
            HStack{
                Rectangle().foregroundColor(.blue).frame( height: 100)
                Rectangle().foregroundColor(.orange).frame( height: 100)
                Rectangle().foregroundColor(.yellow).frame( height: 100)
            }
            HStack{
                Rectangle().foregroundColor(.orange).frame( height: 100)
            }
            HStack{
                Circle().foregroundColor(.green).frame( height: 250)
                Rectangle().frame( height: 250)
                Circle().foregroundColor(.purple).frame( height: 250)
            }
            HStack{
                Rectangle().foregroundColor(.orange).frame( height: 100)
            }
            HStack{
                Rectangle().foregroundColor(.blue).frame( height: 100)
                Rectangle().foregroundColor(.orange).frame( height: 100)
                Rectangle().foregroundColor(.yellow).frame( height: 100)
            }
        }.background(.red)
        .padding()
    }
}

#Preview {
    Excercise1()
}
