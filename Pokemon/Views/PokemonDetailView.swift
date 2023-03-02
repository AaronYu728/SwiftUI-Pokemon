//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by BinYu on 2/3/2023.
//

import SwiftUI

struct PokemonDetailView: View {
    @Environment(\.presentationMode) var presentMode
    var imgModel: IMGModel
    init(_ imgM: IMGModel) {
        self.imgModel = imgM
    }
   
    var body: some View {
        
        VStack {
            Image(imgModel.imgName)
                .resizable()
//                .clipShape(Capsule())
                .scaledToFit()
                .frame(minWidth: nil, idealWidth: nil, maxWidth: UIScreen.main.bounds.width, minHeight: nil, idealHeight: nil, maxHeight: 600, alignment: .center)
            Text(imgModel.imgName)
//                .foregroundColor(convertStringToColor(imgModel.color))
        }
        .navigationTitle(imgModel.imgName)
        .onAppear {
            print("PokemonDetailView Appeared!")
        }
        .onDisappear {
            print("PokemonDetailView Disappeared!")
        }
    }
}

//struct PokemonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let imgM = IMGModel(id: 1, imgName: "Armarouge", strType: "Fire", color: "green")
//        PokemonDetailView(imgM)
//    }
//}
