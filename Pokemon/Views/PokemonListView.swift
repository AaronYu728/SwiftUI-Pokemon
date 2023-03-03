//
//  PokemonListView.swift
//  Pokemon
//
//  Created by BinYu on 1/3/2023.
//

import SwiftUI

struct PokemonListView: View {
//    var pokemonList = [
//        Pokemon(id: 0,name: "Charmander", strType: "Fire", color: .red),
//        Pokemon(id: 1,name: "Squirtle", strType: "Warter", color: .blue),
//        Pokemon(id: 2,name: "Bulbasaur", strType: "Grass", color: .green),
//        Pokemon(id: 3,name: "Pikachu", strType: "Electric", color: .yellow)
//    ]
    let shareInstance = ShareManager.shared()
    var body: some View {
        NavigationView{
            List(shareInstance.dataArr){ imgModel in
                NavigationLink(destination: PokemonDetailView(imgModel)) {
                    HStack {
                        Text("") // This empty text can solve the listRowSeparator break problem in iOS 16 or later
                        Image(imgModel.imgName)
                            .resizable()
                            .frame(width:40, height: 40)
                            .clipShape(Circle())
                            .shadow(radius: 15)
//                        #available(iOS 16, *)
//                            .alignmentGuide(.listRowSeparatorLeading) {$0[.leading]}
                        Text(imgModel.imgName)
                            .padding(.leading, 10)
                    }
                }
            }
            .navigationTitle("Pokemon")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
