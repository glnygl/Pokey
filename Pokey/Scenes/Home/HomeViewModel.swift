//
//  HomeViewModel.swift
//  Pokey
//
//  Created by Glny Gl on 23/07/2024.
//

import Foundation

@Observable
final class HomeViewModel {
    
    var pokeys: [Pokey] = []
    
    func fetchPokeyList() async throws {
        let request = DiscoverRequest()
        let manager = NetworkManager()
        let pokeyList = try await manager.performRequest(type: PokeyList.self, with: request.asURLRequest())
        pokeys = pokeyList.data?[length: 13] ?? []
    }
}

