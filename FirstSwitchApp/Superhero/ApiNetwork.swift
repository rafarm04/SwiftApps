//
//  ApiNetwork.swift
//  FirstSwitchApp
//
//  Created by Rafael Romo Muñoz on 03/12/24.
//

import Foundation

class ApiNetwork{
    
    struct Wrapper:Codable{
        let response:String
        let results:[Superhero]?
    }
    //Need to create new strcuts for every subjson
    struct Superhero:Codable, Identifiable{
        let id:String
        let name:String
        let image:imageSuperhero
    }
    
    struct imageSuperhero:Codable{
        let url:String
    }
    
    func getHeroesByQuery(query: String) async throws -> Wrapper{
        let url = URL(string: "https://superheroapi.com/api/94e3ff11bdafa56b70dd233885a159e9/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        
        return wrapper
    }
}
