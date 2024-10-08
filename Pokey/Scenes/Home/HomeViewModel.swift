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
    var manager: NetworkServiceProtocol
    
    init(manager: NetworkServiceProtocol = NetworkManager()) {
        self.manager = manager
    }
    
    func fetchPokeyList() async throws {
        let request = DiscoverRequest()
        let pokeyList = try await manager.performRequest(type: PokeyList.self, with: request)
        pokeys = pokeyList.data?[length: 12] ?? []
    }
}

