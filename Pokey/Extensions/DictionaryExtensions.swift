//
//  DictionaryExtensions.swift
//  Pokey
//
//  Created by Glny Gl on 24/07/2024.
//

import Foundation

extension Dictionary {
    
    func queryString() -> String {
        let queryString = "?"
        let mappedString = self.compactMap({ key, value in
            "\(key)=\(value)"
        }).joined(separator: "&")
        return  queryString + mappedString
    }
    
}
