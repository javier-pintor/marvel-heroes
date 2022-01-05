//
//  MSCharacterRequestTest.swift
//  MarvelHeroesTests
//
//  Created by Javier Pintor on 5/1/22.
//

import XCTest
@testable import MarvelHeroes

class MSCharacterRequestTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCharacterListSuccess() throws{
        let marvelService = MarvelService()
        let promise = expectation(description: "OK")
        
        marvelService.getCharactersList(){ response in
            if let _ = response.data?.results?.first{
                promise.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    
    func testGetCharacterByIdSuccess() throws{
        let marvelService = MarvelService()
        let promise = expectation(description: "OK")
        
        let id = 1011334
        
        marvelService.getCharacter(id: id){ response in
            if let character = response.data?.results?.first,
               character.id == id{
                promise.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetCharacterByIdFailure() throws{
        let marvelService = MarvelService()
        let promise = expectation(description: "OK")
        
        let id = 12
        
        marvelService.getCharacter(id: id){ response in
            if response.code == 404{
                promise.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

}
