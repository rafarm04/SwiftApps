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
    
    struct SuperheroComplete:Codable{
        let id:String
        let name:String
        let image:imageSuperhero
        let powerstats:PowerStats
        let biography:Biography
    }
    
    struct PowerStats:Codable{
        let intelligence:String
        let strength:String
        let speed:String
        let durability:String
        let power:String
        let combat:String
    }
    
    struct Biography:Codable{
        let alignment:String
        let publisher:String
        let aliases:[String]
        let fullName:String
        
        //XCode can't tell variables with "-" eg: full-name, to solve it we use the following
        enum CodingKeys:String, CodingKey{
            //Have to do it with all the variables for it to work
            case fullName = "full-name"
            case alignment = "alignment"
            case publisher = "publisher"
            case aliases = "aliases"
        }
    }
    
    func getHeroesByQuery(query: String) async throws -> Wrapper{
        let url = URL(string: "https://superheroapi.com/api/94e3ff11bdafa56b70dd233885a159e9/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        
        return wrapper
    }
    
    func getHeroById(id:String)async throws -> SuperheroComplete{
        let url = URL(string: 
            "https://superheroapi.com/api/94e3ff11bdafa56b70dd233885a159e9/\(id)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(SuperheroComplete.self, from: data)
    }
}
