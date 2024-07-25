//
//  HomeView.swift
//  Pokey
//
//  Created by Glny Gl on 22/07/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coordinator: Coordinator
    @State var viewModel = HomeViewModel()
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.pokeys) { pokey in
                    VStack {
                        Text(pokey.name ?? "")
                        Button("Tap button") {
                            coordinator.push(page: .detail)
                            print(pokey.name ?? "")
                        }
                    }
                }
            }
            .padding(10)
            Spacer()
                .navigationTitle("Pokey")
                .onViewDidLoad {
                    Task {
                        do {
                            try await viewModel.fetchPokeyList()
                        } catch {
                            print(CustomError.requestFailed)
                        }
                    }
                }
        }
    }
}

#Preview {
    HomeView()
}
