//
//  ArrayExtensions.swift
//  Pokey
//
//  Created by Glny Gl on 24/07/2024.
//

import Foundation

extension Array {
    
    subscript(length index: Int) -> Array {
        let prefix = self.prefix(index)
        return Array(prefix)
    }
    
}
