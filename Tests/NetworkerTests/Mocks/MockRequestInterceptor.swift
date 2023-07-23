//
//  File.swift
//  
//
//  Created by Sajith Konara on 24/7/23.
//

import Foundation
import Alamofire
@testable import Networker

class MockRequestInterceptor:RequestInterceptor{
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        let updatedMockToken = "fsdgesdgdsg" // token updated from the service
        urlRequest.setValue(updatedMockToken, forHTTPHeaderField: "Authorization")
        completion(.success(urlRequest))
    }
    
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        let configManager = ConfigurationManager.shared
        let response = request.task?.response as? HTTPURLResponse
        
        //tests for 400 instead of 404 since it is easier to reproduce
        if let statusCode = response?.statusCode,
           statusCode == 404{
            if request.retryCount < configManager.requestRetryLimit!{
                completion(.retryWithDelay(configManager.requestRetryDelay!))
            }else{
                completion(.doNotRetry)
            }
        }
    }
}
