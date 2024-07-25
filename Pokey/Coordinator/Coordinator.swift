//
//  Coordinator.swift
//  Pokey
//
//  Created by Glny Gl on 22/07/2024.
//

import SwiftUI
    
    class Coordinator: ObservableObject {
        
        @Published var path = NavigationPath()
        
        func push(page: Page) {
            path.append(page)
        }
        
        func pop() {
            path.removeLast()
        }
        
        func popToRoot() {
            path.removeLast(path.count)
        }
        
        @ViewBuilder
        func build(page: Page) -> some View {
            switch page {
            case .home :
                HomeView()
            case .detail(let pokey) :
                DetailView(pokey: pokey)
            case .favorites :
                FavoritesView()
            }
        }
    }




