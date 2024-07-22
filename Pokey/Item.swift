//
//  Item.swift
//  Pokey
//
//  Created by Glny Gl on 22/07/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
