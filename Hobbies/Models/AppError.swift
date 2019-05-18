//
//  AppError.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/18/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import UIKit

public enum NetworkingErrorTypes: Int
{
    case unknown
    case jsonParsing
    case cloudinaryError
    case tooManyRequests = 429
    case unprocessableEntity = 422
}


public class AppError: BaseModel, Error
{
    public var networkingErrorType: NetworkingErrorTypes?
    public var statusCode: Int?
    public var serverError: Error?
    public var description: String = "Unknown Error!"
    
    public var localizedDescription: String {
        return description
        
    }
}

extension AppError
{
    public static func createNetworkingError(WithType errorType: NetworkingErrorTypes) -> AppError
    {
        let error = AppError()
        error?.networkingErrorType = errorType
        switch errorType {
        case .jsonParsing:
            error?.description = "Json parsing error"
        default:
            error?.description = "Unknown Error!"
            break
        }
        return error!
    }
}
