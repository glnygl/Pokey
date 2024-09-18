//
//  DictionaryExtensions.swift
//  Pokey
//
//  Created by Glny Gl on 24/07/2024.
//

import Foundation

extension Dictionary {
    
    func queryString() -> String {
        if self.isEmpty { return "" }
        let mappedString = self
            .compactMap({ key, value in
            "\(key)=\(value)"
        }).joined(separator: "&")
        return  "?" + mappedString
    }
    
}
