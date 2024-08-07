//
//  PokeyView.swift
//  Pokey
//
//  Created by Glny Gl on 23/07/2024.
//

import SwiftUI

struct PokeyView: View {
    
    var pokey: Pokey
    
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: pokey.img ?? "" ),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                },
                placeholder: {
                    ProgressView()
                }
            )
            Text(pokey.name ?? "")
        }
    }
}
