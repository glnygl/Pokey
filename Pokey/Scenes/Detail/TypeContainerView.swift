//
//  TypeContainerView.swift
//  Pokey
//
//  Created by Glny Gl on 01/10/2024.
//

import SwiftUI

struct TypeContainerView: View {
    
    var types: [String] = []
    var title: String = ""
    
    let rows = [
        GridItem(.fixed(100), spacing: 10),
    ]
    
    var body: some View {
        Text(title)
        LazyHGrid(rows: rows, spacing: 10) {
            ForEach(types, id: \.self) { type in
                let pokeyType = PokeyType(rawValue: type)
                ZStack {
                    Text(type)
                        .foregroundColor(.white)
                }
                .padding(10)
                .background(pokeyType?.typeColor ?? Color.white)
                .cornerRadius(20)
            }
        }
        .frame(height: 40)
    }
}

#Preview {
    TypeContainerView()
}
