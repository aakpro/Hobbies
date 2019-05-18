//
//  BaseModel.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/18/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import ObjectMapper

public class BaseModel: Mappable
{
    public required init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
    }
    
    public required convenience init?()
    {
        self.init(map: Map(mappingType: .fromJSON, JSON: ["" : ""]))
    }
}
