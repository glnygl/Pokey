//
//  ArrayExtensionsUnitTests.swift
//  PokeyUnitTests
//
//  Created by Glny Gl on 18/09/2024.
//

import XCTest
@testable import Pokey

final class ArrayExtensionsUnitTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_subscript_arrayEmpty(){
        
        let array: [String] = []
        let lenght = 2
        
        let result = array[length: lenght]
        
        XCTAssertEqual(result, [])
    }
    
    func test_subscript_lenghtZero(){
        
        let array: [String] = ["a", "b", "c", "d"]
        let lenght = 0
        
        let result = array[length: lenght]
        
        XCTAssertEqual(result, [])
    }
    
    
    func test_subscript_arrayCountGreaterThanLenght(){
        
        
        let array: [String] = ["a", "b", "c", "d"]
        let lenght = 2
        
        let result = array[length: lenght]
        
        XCTAssertGreaterThan(array.count, lenght)
        XCTAssertEqual(result, ["a", "b"])
        
    }
    
    func test_subscript_arrayCountLessThanLenght(){
        
        
        let array: [String] = ["a", "b", "c", "d"]
        let lenght = 6
        
        let result = array[length: lenght]
        
        XCTAssertLessThan(array.count, lenght)
        XCTAssertEqual(result, ["a", "b", "c", "d"])
        
    }
    
    func test_subscript_arrayCountEqualLenght(){
        
        
        let array: [String] = ["a", "b", "c", "d"]
        let lenght = 4
        
        let result = array[length: lenght]
        
        XCTAssertEqual(array.count, lenght)
        XCTAssertEqual(result, ["a", "b", "c", "d"])
        
    }
    

}
