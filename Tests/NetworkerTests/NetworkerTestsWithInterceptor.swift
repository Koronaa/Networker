//
//  NetworkerTestsWithInterceptor.swift
//  
//
//  Created by Sajith Konara on 24/7/23.
//

import XCTest
@testable import Networker

final class NetworkerTestsWithInterceptor: XCTestCase {
    
    var sut:APIManager!
    var config:ConfigurationManager!

    override func setUpWithError() throws {
        try super.setUpWithError()
        config = ConfigurationManager.shared
        config?.setSession(using: URLSessionConfiguration.default,requestInterceptor: MockRequestInterceptor())
        config.setRequestRetry(delay: 2.0, limit: 3)
        sut = APIManager()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        config = nil
    }
    
    func testAPINotFound() async {
        do{
            let _ = try await sut!.makeRequest(with: MockRequest.getName, for: Users.self)
        }catch(let e){
            XCTAssertNotNil(e)
        }
    }

    

}
