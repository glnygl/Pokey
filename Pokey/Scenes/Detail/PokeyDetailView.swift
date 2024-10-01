//
//  PokeyDetailView.swift
//  Pokey
//
//  Created by Glny Gl on 01/10/2024.
//

import SwiftUI

struct PokeyDetailView: View {
    
    var pokey: Pokey?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                HStack {
                    AsyncImage(
                        url: URL(string: pokey?.img ?? "" ),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    .frame(width: 180, height: 140)
                }
                .frame(width: geometry.size.width, height: 180)
                .background(Color.background)
                Rectangle().fill(.accent)
                    .frame(width: geometry.size.width, height: 20)
                    .padding(.bottom)
            }
        }
    }
}
