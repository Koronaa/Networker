//
//  APIManager.swift
//  
//
//  Created by Sajith Konara on 23/7/23.
//

import Foundation
import Alamofire

public class APIManager{
    
    private let configManager = ConfigurationManager.shared
    
    public func makeRequest<T:Decodable>(with request:URLRequestConvertible,for response:T.Type) async throws -> T{
        
        return try await withCheckedThrowingContinuation{ continuation in
            
            if NetworkReachabilityManager()?.isReachable ?? false{
                let dataRequest = configManager.session.request(request)
                
                if configManager.session.interceptor != nil{
                    dataRequest.validate()
                }
                
                dataRequest.responseData { dataResponse in
                    switch dataResponse.result{
                    case .success(let dataObject):
                        if let statusCode = dataResponse.response?.statusCode{
                            switch statusCode{
                            case 200...299:
                                let decoder = JSONDecoder()
                                do{
                                    let decodedObject = try decoder.decode(T.self, from: dataObject)
                                    continuation.resume(returning: decodedObject)
                                }catch (let e){
                                    continuation.resume(throwing: APIError.DecodeError(error: e))
                                }
                            default:
                                continuation.resume(throwing: APIErrorHelper.getError(for: statusCode))
                            }
                        }
                    case .failure(let e):
                        continuation.resume(throwing: APIError.AFError(error: e))
                    }
                }
            }else{
                continuation.resume(throwing: APIError.NoInternetConnection)
            }
            
        }
    }
    
}
