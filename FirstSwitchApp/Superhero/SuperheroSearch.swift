//
//  SuperheroFinder.swift
//  FirstSwitchApp
//
//  Created by Rafael Romo Muñoz on 03/12/24.
//
//94e3ff11bdafa56b70dd233885a159e9
import SwiftUI
import SDWebImageSwiftUI

struct SuperheroSearch: View {
    @State var superheroName:String = ""
    @State var wrapper:ApiNetwork.Wrapper? = nil
    @State var loading:Bool = false
    
    var body: some View {
        VStack{
            
            //let url = "https://superheroapi.com/api/94e3ff11bdafa56b70dd233885a159e9/search/name"
            
            TextField(
                "",
                text: $superheroName,
                prompt: Text("Search for a superhero")
                    .font(.title2)
                    .foregroundColor(.gray)
            )
            .font(.title2)
            .foregroundColor(.white)
            .padding(16)
            .border(.purple)
            .padding()
            .autocorrectionDisabled()
            //When pressed enter than it will display the result
            .onSubmit {
                loading = true
                print(superheroName)
                Task{
                    do{
                        wrapper = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                    }catch{
                        print(error.localizedDescription)
                    }
                    loading = false
                }
                if loading{
                    ProgressView().tint(.white)
                }
            }
            NavigationStack{
                List(wrapper?.results ?? []){ superhero in
                    ZStack{
                        SuperheroItem(superhero: superhero)
                        NavigationLink(destination: {}){EmptyView().opacity(0)}
                    }.listRowBackground(
                        Color.backgroundApp)
                }.listStyle(.plain)
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
    }
}

struct SuperheroItem:View{
    let superhero:ApiNetwork.Superhero
    var body: some View{
        ZStack{
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity) //while loading image, show indication of loading
                .scaledToFill()
                .frame(height: 200)
            VStack{
                Spacer()
                Text("\(superhero.name)").foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
                
            }
        }.frame(height: 200).cornerRadius(32)
    }
}

#Preview {
    SuperheroSearch()
}
