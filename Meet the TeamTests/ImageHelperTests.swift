//
//  ImageHelperTests.swift
//  Meet the TeamTests
//
//  Created by Reiaz Gafar on 6/15/18.
//  Copyright © 2018 Reiaz Gafar. All rights reserved.
//

import XCTest
@testable import Meet_the_Team

class ImageHelperTests: XCTestCase {
    
    let validImageURL = "https://d1ghufavkue0e7.cloudfront.net/cache/d4/67/d4670ffa4ed318affdca8c8452db892d.jpg"
    
    func testLoadValidImage() {
        let exp = expectation(description: "data loaded")
        
        var testImage: UIImage? = nil

        ImageHelper.manager.getImage(from: validImageURL) { (image, error) in
            if let error = error {
                XCTFail("error loading image: \(error)")
            } else if let image = image {
                testImage = image
                exp.fulfill()
            }
        }
        
        wait(for: [exp], timeout: 3.0)
        XCTAssertNotNil(testImage, "image successfully retrieved")
        
    }
    
}
