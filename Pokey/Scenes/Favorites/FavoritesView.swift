//
//  FavoritesView.swift
//  Pokey
//
//  Created by Glny Gl on 22/07/2024.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    @Query private var favorites : [FavoritePokeyItem]
    
    let columns = [
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(favorites) { favoritePokey in
                    ZStack() {
                        VStack(spacing: 0) {
                            PokeyView(pokey: favoritePokey.convertToPokey())
                                .frame(width: (UIScreen.main.bounds.width - 30) / 3, height: 180)
                                .background(Color.background)
                                .onTapGesture {
                                    coordinator.push(page: .detail(pokey: favoritePokey.convertToPokey()))
                                }
                            Rectangle()
                                .fill(.accent)
                                .frame(width: (UIScreen.main.bounds.width - 30) / 3 , height: 10)
                        }
                        .cornerRadius(10)
                        .giveShadow(color: .gray, radius: 4, x: 2.0, y: 2.0)
                    }
                }
            }
            .padding(6)
            Spacer()
                .navigationTitle("Favorites")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("", systemImage: "trash.fill") {
                    do {
                        try context.delete(model: FavoritePokeyItem.self)
                    } catch {
                        print(CustomError.deleteFailed)
                    }
                    try! context.save()
                }
            }
        }
    }
}
