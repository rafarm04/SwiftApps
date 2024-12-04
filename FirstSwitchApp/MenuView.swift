//
//  MenuView.swift
//  FirstSwitchApp
//
//  Created by Rafael Romo Muñoz on 01/12/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        //How to navigate through views
        NavigationStack {
            List {
//                NavigationLink {
//                    
//                } label: {
//                    Text("IMC Calculator")
//                }
                //Cleaner NavigationLink
                NavigationLink(destination: IMCView()){
                    Text("IMC Calculator")
                }
                NavigationLink(destination: SuperheroSearch()){
                    Text("Superhero Search")
                }
                Text("App 3")
                Text("App 4")
            }
        }
    }
}

#Preview {
    MenuView()
}
