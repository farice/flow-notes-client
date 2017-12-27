//
//  Flow_NotesTests.swift
//  Flow-NotesTests
//
//  Created by Faris Sbahi on 12/26/17.
//  Copyright © 2017 Pauca, Inc. All rights reserved.
//

import XCTest
import Flow_Notes

class Flow_NotesTests: XCTestCase {
    
    var testGraph: ALGraph<Int>!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testGraph = ALGraph<Int>()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let one = testGraph.createNode(5)
        let two = testGraph.createNode(3)
        let three = testGraph.createNode(6)
        testGraph.addDirectedEdge(one, to: two)
        testGraph.addDirectedEdge(one, to: three)
        print(testGraph.description)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            
            let one = testGraph.createNode(5)
            let two = testGraph.createNode(3)
            let three = testGraph.createNode(6)
            testGraph.addDirectedEdge(one, to: two)
            testGraph.addDirectedEdge(one, to: three)
            print(testGraph.description)
        }
    }
    
}
