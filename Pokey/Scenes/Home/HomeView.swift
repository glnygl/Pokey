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
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6)
    ]
    
    var body: some View {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.pokeys) { pokey in
                        ZStack() {
                            VStack(spacing: 0) {
                                PokeyView(pokey: pokey)
                                    .containerRelativeFrame([.horizontal, .vertical], {
                                        length, axis in
                                        if axis == .horizontal {
                                            ( length - 30 ) / 3
                                        } else { 180 }
                                    })
                                    .background(Color.background)
                                    .onTapGesture {
                                        coordinator.push(page: .detail(pokey: pokey))
                                    }
                                    .environment(\.fontSize, .subheadline)
                                Rectangle()
                                    .fill(.accent)
                                    .containerRelativeFrame([.horizontal, .vertical], {
                                        length, axis in
                                        if axis == .horizontal {
                                            ( length - 30 ) / 3
                                        } else { 10 }
                                    })
                            }
                            .cornerRadius(10)
                            .giveShadow(color: .gray, radius: 4, x: 2.0, y: 2.0)
                        }
                    }
                }
                .padding(6)
                Spacer()
                    .navigationTitle("Pokey")
            }
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

#Preview {
    HomeView()
}
