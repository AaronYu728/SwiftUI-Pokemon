//
//  DateModel.swift
//  Pokemon
//  Created by BinYu on 2/3/2023.
//  Using pokeapi.co instead after

import Foundation
import SwiftUI

struct IMGModel: Codable, Identifiable {
    var id: Int
    var imgName: String
    var strType: String
    var color: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case imgName = "img_name"
        case strType = "str_type"
        case color
    }
}

struct JSONModel: Codable {
    var imgarr: [IMGModel]

    private enum CodingKeys: String, CodingKey {
        case imgarr = "imgArr"
    }
}

class ShareManager {
    let path: String
    private init(_ filename: String) {
        self.path = filename
    }
    
    var dataArr: [IMGModel] {
        let JSModel: JSONModel = loadDataWithURL("ImageList.json")
        return JSModel.imgarr
    }
    
    private static let shareedManager: ShareManager = {
        let shared = ShareManager("")
        //...
        return shared
    }()
    
    class func shared() -> ShareManager {
        return shareedManager
    }
}

private func loadDataWithURL<T: Decodable>(_ filename: String) -> T {
    let localData: Data
    
//    guard let filePath = Bundle.main.path(forResource: filename, ofType: nil)
    guard let filePath = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        localData = try Data(contentsOf: filePath)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        return try JSONDecoder().decode(T.self, from: localData)
    } catch {
        fatalError("Counldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

/*
func convertStringToColor(_ strColor: String) -> Color {
    let color: Color?
    switch strColor {
    case "red":
        color = Color.red
    case "green":
        color = Color.green
    case "blue":
        color = Color.blue
    case "purple":
        color = Color.purple
    case "gray":
        color = Color.gray
    case "black":
        color = Color.black
    case "brown":
        color = Color.brown
    case "cyan":
        color = Color.cyan
    case "indigo":
        color = Color.indigo
    case "mint":
        color = Color.mint
    case "orange":
        color = Color.orange
    case "pink":
        color = Color.pink
    case "yellow":
        color = Color.yellow
    case "secondary":
        color = Color.secondary
    case "teal":
        color = nil
    default:
        color = Color.secondary
        
    }
    return color!
}
*/
