//
//  HomeViewModelUnitTests.swift
//  PokeyUnitTests
//
//  Created by Glny Gl on 22/09/2024.
//

import XCTest
import Testing
@testable import Pokey

// MARK: Swift Testing

@Suite("Home View Model SwiftTesting")
struct HomeViewModelSwiftTesting {
    
    let manager = MockNetworkManager()
    
    @Test(.tags(.apiSuccess))
    func fetchData_succesful() async {
        
        manager.shouldThrowError = false
        let viewModel = HomeViewModel(manager: manager)
        
        do {
            try await viewModel.fetchPokeyList()
        } catch {
            #expect(error == nil)
        }
        
        #expect(viewModel.pokeys.count > 0)
        
    }
    
    @Test(.tags(.apiFail))
    func fetchData_fail() async {
        
        manager.shouldThrowError = true
        let viewModel = HomeViewModel(manager: manager)
        
        do {
            try await viewModel.fetchPokeyList()
        } catch {
            #expect(error != nil)
        }
        
        #expect(viewModel.pokeys.count == 0)
    }
}

// MARK: XCTest

final class HomeViewModelUnitTests: XCTestCase {
    
    fileprivate var viewModel: HomeViewModel!
    fileprivate var manager: MockNetworkManager!

    override func setUp() {
        super.setUp()
        manager = MockNetworkManager()
    }
    
    override func tearDown() {
        viewModel = nil
        manager = nil
        super.tearDown()
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
