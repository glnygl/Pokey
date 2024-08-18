//
//  HomeWatchView.swift
//  PokeyWatch Watch App
//
//  Created by Glny Gl on 07/08/2024.
//

import SwiftUI

struct HomeWatchView: View {
    @State var viewModel = HomeViewModel()
    
    let columns = [
        GridItem(.flexible(), spacing: 6),
    ]
    
    var body: some View {
        NavigationView {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.pokeys) { pokey in
                            NavigationLink(destination: DetailWatchView(pokey: pokey)) {
                            VStack(spacing: 0) {
                                    Text(pokey.name ?? "")
                                        .frame(height: 48)
                                        .containerRelativeFrame(.horizontal, { width, _ in width - 20 })
                                        .background(Color.accentColor)
                                        .cornerRadius(10)
                            }
                            }
                            .background(Color.black)
                            .frame(height: 48)
                            .containerRelativeFrame(.horizontal, { width, _ in width - 20 })
                        }
                    }
                    .padding(6)
                    Spacer()
                }
                .background(Color.black)
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
    HomeWatchView()
}
