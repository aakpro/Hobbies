//
//  BaseNetworkingServices.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/18/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import Alamofire
import ObjectMapper
import Foundation

public class BaseNetworkingServices: NSObject
{
    internal var baseURL = "https://raw.githubusercontent.com/AmirDaliri/getTestJson/master/"
    public func request(endpoint:String,
                        method:HTTPMethod,
                        body:Dictionary<String,Any>!,
                        headers: Dictionary<String,String>! = nil,
                        encoding: ParameterEncoding = JSONEncoding.default,
                        completionHandler: @escaping (Result<Any>) -> Void)
    {
        let dataRequest = Alamofire.request("\(self.baseURL)\(endpoint)",
            method: method,
            parameters: body,
            encoding: encoding,
            headers: headers)
        dataRequest.responseJSON { (dataResponse) in
            switch dataResponse.result {
            case .success(let successResult):
                completionHandler(.success(successResult))
                break
            case .failure(let errorResult):
                completionHandler(.failure(errorResult))
                break
            }
        }
        
    }
}
