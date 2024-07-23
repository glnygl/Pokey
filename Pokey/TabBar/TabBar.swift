//
//  TabBar.swift
//  Pokey
//
//  Created by Glny Gl on 22/07/2024.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeCoordinatorView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            FavoritesCoordinatorView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
        }
    }
}

#Preview {
    TabBar()
}
