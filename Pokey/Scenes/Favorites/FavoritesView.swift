//
//  FavoritesView.swift
//  Pokey
//
//  Created by Glny Gl on 22/07/2024.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        Text("FavoritesView")
    }
}

#Preview {
    FavoritesView()
}
