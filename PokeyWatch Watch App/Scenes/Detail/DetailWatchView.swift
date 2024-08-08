//
//  DetailWatchView.swift
//  PokeyWatch Watch App
//
//  Created by Glny Gl on 07/08/2024.
//

import SwiftUI

struct DetailWatchView: View {
    var pokey: Pokey?
    
    var body: some View {
        Text(pokey?.name ?? "")
    }
}

#Preview {
    DetailWatchView()
}
