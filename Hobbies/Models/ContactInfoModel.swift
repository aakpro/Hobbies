//
//  ContactInfoModel.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/19/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import ObjectMapper

enum ContactInfoTypes: String
{
    case website = "website"
    case email = "email"
    case phoneNumber = "phoneNumber"
}

typealias ContactInfoModel = Dictionary<String,Array<String>>
