//
//  HomeViewModelUnitTests.swift
//  PokeyUnitTests
//
//  Created by Glny Gl on 22/09/2024.
//

import XCTest
@testable import Pokey

final class HomeViewModelUnitTests: XCTestCase {
    
    fileprivate var viewModel: HomeViewModel!
    fileprivate var manager: MockNetworkManager!

    override func setUp() {
        super.setUp()
        manager = MockNetworkManager()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
        manager = nil
    }
    
    func test_fetchData_succesful() async {
        
        manager.shouldThrowError = false
        viewModel = HomeViewModel(manager: manager)
        
        do {
            try await viewModel.fetchPokeyList()
        } catch {
            XCTAssertNil(error)
        }
        
        XCTAssertGreaterThan(viewModel.pokeys.count, 0)
    }
    
    func test_fetchData_fail() async throws {
        
        
        manager.shouldThrowError = true
        viewModel = HomeViewModel(manager: manager)
        
        do {
            try await viewModel.fetchPokeyList()
        } catch {
            XCTAssertNotNil(error)
        }
        
        XCTAssertEqual(viewModel.pokeys.count, 0)
        
    }
    

}
