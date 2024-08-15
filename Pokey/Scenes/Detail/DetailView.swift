//
//  DetailView.swift
//  Pokey
//
//  Created by Glny Gl on 22/07/2024.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    @State var viewModel = DetailViewModel()
    @Query private var favorites : [FavoritePokeyItem]
    
    var pokey: Pokey?
    
    var body: some View {
        Text(pokey?.name ?? "")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("", systemImage: viewModel.isFavorite ? "heart.fill" : "heart") {
                        guard let pokeyItem = pokey?.convertPokeyItem() else { return }
                        if viewModel.isFavorite {
                            guard let selectedPokey = favorites.getSelectedPokey(pokeyId: pokeyItem.id ?? -1) else { return }
                            context.delete(selectedPokey)
                        } else {
                            context.insert(pokeyItem)
                        }
                        try! context.save()
                        viewModel.isFavorite.toggle()
                    }
                }
            }
            .onViewDidLoad {
                viewModel.isFavorite = favorites.checkIsFavorite(pokeyId: pokey?.id ?? -1)
            }
    }
}
