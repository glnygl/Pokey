//
//  PokeyItem.swift
//  Pokey
//
//  Created by Glny Gl on 22/07/2024.
//

import SwiftData

@Model
final class FavoritePokeyItem {
    var id: Int?
    let name: String?
    let img: String?
    let type: [String]?
    let weaknesses: [String]?
    let height: String?
    let weight: String?
    let candy: Int?
    
    init(id: Int? = nil, name: String?, img: String?, type: [String]?, weaknesses: [String]?, height: String?, weight: String?, candy: Int?) {
        self.id = id
        self.name = name
        self.img = img
        self.type = type
        self.weaknesses = weaknesses
        self.height = height
        self.weight = weight
        self.candy = candy
    }
}
