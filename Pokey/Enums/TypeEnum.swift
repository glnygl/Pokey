//
//  TypeEnum.swift
//  Pokey
//
//  Created by Glny Gl on 01/10/2024.
//

import SwiftUI

enum PokeyType: String {
    case ice = "Ice"
    case bug = "Bug"
    case fire = "Fire"
    case rock = "Rock"
    case water = "Water"
    case grass = "Grass"
    case poison = "Poison"
    case flying = "Flying"
    case ground = "Ground"
    case psychic = "Psychic"
    case electric = "Electric"
    
    
    var typeColor: Color {
         switch self {
         case .ice: return .mint
         case .bug: return .orange
         case .fire:  return .red
         case .rock:  return .gray
         case .water:  return .blue
         case .grass:  return .green
         case .poison: return .indigo
         case .flying: return .cyan
         case .ground: return .brown
         case .psychic: return .pink
         case .electric: return .teal
         }
     }
}
