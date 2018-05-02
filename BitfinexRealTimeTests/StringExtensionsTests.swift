//
//  StringExtensionsTests.swift
//  BitfinexRealTimeTests
//
//  Created by Ferdinando Messina on 02.05.18.
//  Copyright © 2018 Ferdinando Messina. All rights reserved.
//

import XCTest

class StringExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSeparateStringEveryZeroCharacters() {
        
        // Given
        let exampleString = "justastring"
        let zeroCharsStep = 0
        
        // When
        let exampleStringZeroSeparated = exampleString.separated(every: zeroCharsStep, withSeparator: "$")
        
        // Then
        XCTAssertEqual(exampleString, exampleStringZeroSeparated)
    }
    
    
    func testSeparateStringWithEmptySeparator() {
        
        // Given
        let exampleString = "justanotherstring"
        let emptySeparator = ""
        
        // When
        let exampleStringSeparated = exampleString.separated(every: 2, withSeparator: emptySeparator)
        
        // Then
        XCTAssertEqual(exampleString, exampleStringSeparated)
    }
    
    
    func testSeparateStringWithEmojiCharacter() {
        
        // Given
        let pizzaString = "pizzapizzapizza"
        let emojiSeparator = "🍕"
        let handmadeSeparatedString = "pizza🍕pizza🍕pizza"
        
        // When
        let pizzaSeparatedPizzaString = pizzaString.separated(every: "pizza".count, withSeparator: emojiSeparator)
        
        // Then
        XCTAssertEqual(handmadeSeparatedString, pizzaSeparatedPizzaString)
    }
    
   
    func testSeparateStringWithDoubleCharSeparator() {

        // Given
        let exampleString = "exampleString"
        let doubleCharSeparator = "-*"
        let handmadeSeparatedString = "ex-*am-*pl-*eS-*tr-*in-*g"

        // When
        let exampleStringSeparated = exampleString.separated(every: 2, withSeparator: doubleCharSeparator)
        
        // Then
        XCTAssertEqual(handmadeSeparatedString, exampleStringSeparated)
    }
    
  
    func testSeparateStringNotSeparable() {
      
        // Given
        let emptyString = ""
        let oneCharString = "1"
        
        // When
        let emptyStringSeparated = emptyString.separated(every: 2, withSeparator: "-")
        let oneCharStringSeparated = oneCharString.separated(every: 3, withSeparator: "*")
        
        // Then
        XCTAssertEqual(emptyString, emptyStringSeparated)
        XCTAssertEqual(oneCharString, oneCharStringSeparated)
    }
}
