//
//  FavoritesCoordinatorView.swift
//  Pokey
//
//  Created by Glny Gl on 22/07/2024.
//

import SwiftUI

struct FavoritesCoordinatorView: View {
    @ObservedObject private var coordinator = Coordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .favorites)
            .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }.environmentObject(coordinator)
    }
}

#Preview {
    FavoritesCoordinatorView()
}
