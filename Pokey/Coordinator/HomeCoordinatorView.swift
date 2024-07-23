//
//  HomeCoordinatorView.swift
//  Pokey
//
//  Created by Glny Gl on 22/07/2024.
//

import SwiftUI

struct HomeCoordinatorView: View {
    @ObservedObject private var coordinator = Coordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .home)
            .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }.environmentObject(coordinator)
    }
}

#Preview {
    HomeCoordinatorView()
}
