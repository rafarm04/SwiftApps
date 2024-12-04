//
//  ListExample.swift
//  FirstSwitchApp
//
//  Created by Rafael Romo Muñoz on 03/12/24.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Squirtle")
]

var digimons = [
    Digimon(name: "x"),
    Digimon(name: "y")
]

struct ListExample: View {
    var body: some View {
        //Basic List
//        List{
//            Text("Hello World")
//            Text("Hello World")
//            Text("Hello World")
//        }
//        List{
//            //id: \.name is a key id
//            ForEach(pokemons, id: \.name) { pokemon in
//                    Text(pokemon.name)
//            }
//        }
        
//        List(digimons){ digimon in
//            Text(digimon.name)
//            
//        }
//        List{
//            ForEach(digimons){digimon in
//                    Text(digimon.name)
//            }
//        }
        
        List{
            Section(header: Text("Pokemons")){
                ForEach(pokemons, id: \.name) { pokemon in
                    Text(pokemon.name)
                }
            }
            Section(header: Text("Digimons")){
                ForEach(digimons){digimon in
                    Text(digimon.name)
                }
            }
        }
        
    }
}

struct Pokemon {
    let name:String
}

struct Digimon:Identifiable {
    var id = UUID()
    let name:String
}

#Preview {
    ListExample()
}
