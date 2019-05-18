//
//  CategoryModel.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/18/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import ObjectMapper

public class CategoryModel: BaseModel
{
    var id: String?
    var updatedAt: Date?
    var title: String?
    var description: String?
    var active: Bool?
    var createdAt: Date?
    
    public required init?(map: Map)
    {
        super.init(map: map)
    }
    
    public override func mapping(map: Map)
    {
        super.mapping(map: map)
        
        id                 <- map["_id"]
        title              <- map["title"]
        updatedAt          <- (map["updated_at"], CustomDateFormatTransform(formatString: "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"))
        description        <- map["description"]
        active             <- map["_active"]
        createdAt          <- (map["created_at"], CustomDateFormatTransform(formatString: "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"))
    }
}
