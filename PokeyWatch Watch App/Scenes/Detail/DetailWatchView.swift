//
//  DetailWatchView.swift
//  PokeyWatch Watch App
//
//  Created by Glny Gl on 07/08/2024.
//

import SwiftUI

struct DetailWatchView: View {
    var pokey: Pokey?
    @State var isFavorite: Bool = true
    
    var body: some View {
        Text(pokey?.name ?? "")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: isFavorite ? "heart.fill" : "heart" ) {
                        self.isFavorite.toggle()
                    }
                }
            }
    }
}

#Preview {
    DetailWatchView()
}
