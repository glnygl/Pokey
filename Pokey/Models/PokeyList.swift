//
//  PokeyList.swift
//  Pokey
//
//  Created by Glny Gl on 23/07/2024.
//

import Foundation
import SwiftData

struct PokeyList: Codable {
    let data: [Pokey]?
    
    enum CodingKeys: String, CodingKey {
        case data = "pokemon"
    }
}

struct Pokey: Codable, Identifiable, Hashable {
    
    let id: Int?
    let name: String?
    let img: String?
    let type: [String]?
    let weaknesses: [String]?
    let height: String?
    let weight: String?
    let candy: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case id, name, img, type, weaknesses, height, weight
        case candy = "candy_count"
    }
    
    func convertPokeyItem() -> FavoritePokeyItem {
        FavoritePokeyItem(id: self.id, name: self.name, img: self.img, type: self.type, weaknesses: self.weaknesses, height: self.height, weight: self.weight, candy: self.candy)
    }
}
