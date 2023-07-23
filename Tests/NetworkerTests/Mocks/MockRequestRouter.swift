//
//  File.swift
//  
//
//  Created by Sajith Konara on 23/7/23.
//

import Foundation
import Alamofire

enum MockRequest:URLRequestConvertible{
    
    case getUsers
    case getName
    
    var path:String{
        switch self {
        case .getUsers:
            return "/profile"
        case .getName:
            return "/name"
        }
    }
    
    var method:HTTPMethod{
        switch self {
        case .getUsers:
            return .get
        case .getName:
            return .get
        }
    }
    
    var params:Parameters?{
        switch self {
        case .getUsers,.getName:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseURL = "https://64bd3fa42320b36433c788c7.mockapi.io"
        let url =  try URL(string: baseURL.asURL().appendingPathComponent(path).absoluteString.removingPercentEncoding!)!
        let request = try URLRequest(url: url, method: method)
        return try URLEncoding.default.encode(request, with: params)
    }
    
}
