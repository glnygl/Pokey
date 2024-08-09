//
//  DetailWatchView.swift
//  PokeyWatch Watch App
//
//  Created by Glny Gl on 07/08/2024.
//

import SwiftUI

struct DetailWatchView: View {
    var pokey: Pokey?
    @State var isSelected: Bool = true
    
    var body: some View {
        Text(pokey?.name ?? "")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: isSelected ? "heart.fill" : "heart" ) {
                        self.isSelected.toggle()
                    }
                }
            }
    }
}

#Preview {
    DetailWatchView()
}
