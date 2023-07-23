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
    var urlSessionConfiguration:URLSessionConfiguration!
    var requestInterceptor:RequestInterceptor?
    
    private init (){}
    
    public func setSession(using urlSessionConfiguration:URLSessionConfiguration,requestInterceptor:RequestInterceptor? = nil){
        self.session = Session(configuration: urlSessionConfiguration,interceptor: requestInterceptor)
    }
    
}

