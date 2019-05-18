//
//  HobbiesTests.swift
//  HobbiesTests
//
//  Created by Amir Abbas Kashani on 5/18/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import XCTest
@testable import Hobbies

class NetworkingTests: XCTestCase
{
    let categoryServices = CategoryServices()
    func testIfCallingApiWorks()
    {
        let expectation = XCTestExpectation(description: "category list test")
        categoryServices.getAllCategories { (categories, error) in
            XCTAssertNil(error, "api error = \(String(describing: error?.description))")
            XCTAssertNotNil(categories, "categories is nil")
            for category in categories! {
                self.check(category: category)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 30)
    }
}

extension NetworkingTests
{
    func check(category: CategoryModel)
    {
        XCTAssertNotNil(category.id, "category id is nil error - id \(category.id!)")
        XCTAssertNotNil(category.updatedAt, "category updatedAt is nil error - id \(category.id!)")
        XCTAssertNotNil(category.title, "category title is nil error - id \(category.id!)")
//        XCTAssertNotNil(category.description, "category description is nil error - id \(category.id!)")
        XCTAssertNotNil(category.active, "category active is nil error - id \(category.id!)")
        XCTAssertNotNil(category.createdAt, "category createdAt is nil error - id \(category.id!)")
    }
}
