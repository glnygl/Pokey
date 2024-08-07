//
//  TabWatchView.swift
//  PokeyWatch Watch App
//
//  Created by Glny Gl on 06/08/2024.
//

import SwiftUI

struct TabWatchView: View {
    
    var body: some View {
        TabView() {
            HomeWatchView()
            FavoritesWatchView()
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    TabWatchView()
}
