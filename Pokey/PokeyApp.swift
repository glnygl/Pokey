//
//  PokeyApp.swift
//  Pokey
//
//  Created by Glny Gl on 22/07/2024.
//

import SwiftUI
import SwiftData

@main
struct PokeyApp: App {
    var body: some Scene {
        WindowGroup {
            TabBar()
                .modelContainer(for: FavoritePokeyItem.self)
        }
    }
}
