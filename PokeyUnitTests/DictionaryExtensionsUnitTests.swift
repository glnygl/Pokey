//
//  DictionaryExtensionsUnitTests.swift
//  PokeyUnitTests
//
//  Created by Glny Gl on 18/09/2024.
//

import XCTest
@testable import Pokey

final class DictionaryExtensionsUnitTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_queryString_dictionaryEmpty() {
        let dictionary: [String: String] = [:]
        let result = dictionary.queryString()
        XCTAssertEqual(result, "")
    }
    
    func test_queryString_dictionarySingleValue() {
        let dictionary: [String: String] = ["name":"gg"]
        let result = dictionary.queryString()
        XCTAssertEqual(result, "?name=gg")
    }
    
    func test_queryString_dictionaryMultipleValue() {
        let dictionary: [String: String] = ["first":"glny", "second":"gl"]
        let result = dictionary.queryString()
        XCTAssertTrue(result == "?first=glny&second=gl" || result == "?second=gl&first=glny")
    }

}
