//
//  ConfigurationManager.swift
//  
//
//  Created by Sajith Konara on 23/7/23.
//

import Foundation
import Alamofire

public class ConfigurationManager{
    
    public static let shared = ConfigurationManager()
    
    var session:Session!
    var requestRetryLimit:Int?
    var requestRetryDelay:TimeInterval?
    
    private var urlSessionConfiguration:URLSessionConfiguration!
    
    private init (){}
    
    public func setSession(using urlSessionConfiguration:URLSessionConfiguration,requestInterceptor:RequestInterceptor? = nil){
        self.session = Session(configuration: urlSessionConfiguration,interceptor: requestInterceptor)
    }
    
    public func setRequestRetry(delay val1:TimeInterval, limit val2:Int){
        if session.interceptor == nil{
            fatalError("Request Interceptor cannot be nil, invoke setSession(using urlSessionConfiguration:URLSessionConfiguration,requestInterceptor:RequestInterceptor)")
        }
        requestRetryDelay = val1
        requestRetryLimit = val2
    }
    
    
    
}

