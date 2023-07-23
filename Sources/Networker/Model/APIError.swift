//
//  APIError.swift
//  
//
//  Created by Sajith Konara on 23/7/23.
//

import Foundation

public enum APIError: Error,LocalizedError{
    
    case AFError(error:Error)
    case DecodeError(error:Error)
    case Unhandled
    case BadRequest //400
    case UnAuthorized //401
    case Forbidden //403
    case NotFound //404
    case RequestTimeout //408
    case TooManyRequest //429
    case InternalServerError //500
    case BadGateway //502
    case ServiceUnavailable //503
    case GatewayTimeout //504
    
    
    
    public var errorDescription: String?{
        switch self {
        
        case .AFError(let error):
            return error.localizedDescription
        case .DecodeError(let error):
            return error.localizedDescription
        case .Unhandled:
            return "Unhadled error"
        case .BadRequest:
            return "Bad Request"
        case .UnAuthorized:
            return "UnAuthorized"
        case .Forbidden:
            return "Forbidden"
        case .NotFound:
            return "Not Found"
        case .RequestTimeout:
            return "Request Timeout"
        case .TooManyRequest:
            return "Too Many Request"
        case .InternalServerError:
            return "Internal Server Error"
        case .BadGateway:
            return "Bad Gateway"
        case .ServiceUnavailable:
            return "Service Unavailable"
        case .GatewayTimeout:
            return "Gateway Timeout"
        }
    }
    
}

class APIErrorHelper{
    
    
    static func getError(for code:Int) -> APIError{
        switch code{
        case 400:
            return .BadRequest
        case 401:
            return .UnAuthorized
        case 403:
            return .Forbidden
        case 404:
            return .NotFound
        case 408:
            return .RequestTimeout
        case 429:
            return .TooManyRequest
        case 500:
            return .InternalServerError
        case 502:
            return .BadGateway
        case 503:
            return .ServiceUnavailable
        case 504:
            return .GatewayTimeout
        default:
            return .Unhandled
        }
    }
}
