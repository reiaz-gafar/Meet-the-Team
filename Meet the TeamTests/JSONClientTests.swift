//
//  JSONClientTests.swift
//  Meet the TeamTests
//
//  Created by Reiaz Gafar on 6/15/18.
//  Copyright © 2018 Reiaz Gafar. All rights reserved.
//

import XCTest
@testable import Meet_the_Team

class JSONClientTests: XCTestCase {
    
    func testLoadData() {
        let exp = expectation(description: "data loaded")
        
        var jsonData: Data? = nil
        
        JSONClient.loadData { (data, error) in
            if let error = error {
                XCTFail("error retrieving data: \(error)")
            } else if let data = data {
                jsonData = data
                exp.fulfill()
            }
        }
        
        
        wait(for: [exp], timeout: 3.0)
        XCTAssertNotNil(jsonData, "data recieved is not nil")
    }
    
    func testTeamCount() {
        let exp = expectation(description: "data parsed")
        
        var teamCount = 0
        
        JSONClient.parseJSON { (members, error) in
            if let error = error {
                XCTFail("error parsing: \(error)")
            } else if let members = members {
                teamCount = members.count
                exp.fulfill()
            }
        }
        
        wait(for: [exp], timeout: 3.0)
        XCTAssertEqual(11, teamCount, "there are 11 team members")
        
    }
    
}
