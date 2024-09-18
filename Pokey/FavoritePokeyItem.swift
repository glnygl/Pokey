//
//  FavoritePokeyItem.swift
//  Pokey
//
//  Created by Glny Gl on 22/07/2024.
//

import SwiftData

@Model
class FavoritePokeyItem {
    var id: Int?
    var name: String?
    var img: String?
    var type: [String]?
    var weaknesses: [String]?
    var height: String?
    var weight: String?
    var candy: Int?
    
    init(id: Int?, name: String?, img: String?, type: [String]?, weaknesses: [String]?, height: String?, weight: String?, candy: Int?) {
        self.id = id
        self.name = name
        self.img = img
        self.type = type
        self.weaknesses = weaknesses
        self.height = height
        self.weight = weight
        self.candy = candy
    }
    
    func convertToPokey() -> Pokey {
        Pokey(id: self.id, name: self.name, img: self.img, type: self.type, weaknesses: self.weaknesses, height: self.height, weight: self.weight, candy: self.candy)
    }
}


typealias FavoritePokeyItemArray = [FavoritePokeyItem]

extension FavoritePokeyItemArray {
    
    func checkIsFavorite(pokeyId: Int) -> Bool {
        let ids = self.map { $0.id }
        return ids.contains(pokeyId) ? true : false
    }
    
    func getSelectedPokey(pokeyId: Int) -> FavoritePokeyItem? {
        self.filter({ $0.id == pokeyId}).first ?? nil
    }
}
