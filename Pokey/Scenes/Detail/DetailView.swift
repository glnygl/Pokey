//
//  DetailView.swift
//  Pokey
//
//  Created by Glny Gl on 22/07/2024.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var coordinator: Coordinator
    var pokey: Pokey?
    
    var body: some View {
        Text(pokey?.name ?? "")
    }
}

