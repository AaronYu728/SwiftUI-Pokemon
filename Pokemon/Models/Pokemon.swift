//
//  Pokemon.swift
//  Pokemon
//
//  Created by BinYu on 2/3/2023.
//

import Foundation
import SwiftUI

struct Pokemon: Identifiable {
    var id: Int //Identifiable must implement an property called id, and must be Hashable (Int,String,float)
    let name: String
    let strType: String
    let color: Color
}
