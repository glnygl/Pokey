//
//  PageEnum.swift
//  Pokey
//
//  Created by Glny Gl on 25/07/2024.
//

import Foundation

enum Page : Hashable {

    case home
    case detail(pokey: Pokey)
    case favorites


    func hash(into hasher: inout Hasher) {
        switch self {
        case .home: hasher.combine(-1)
        case .detail(_): hasher.combine(-2)
        case .favorites: hasher.combine(-3)
        }
    }

    static func == (lhs: Page, rhs: Page) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
    private var rawValue : String {
        let value : String
        switch self {
        case .home: value = "home"
        case .detail(_): value = "detail"
        case .favorites: value = "favorites"
        }
        return value
    }

}
