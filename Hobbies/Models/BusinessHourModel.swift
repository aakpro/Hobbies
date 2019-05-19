
//
//  BusinessHour.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/19/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import ObjectMapper

enum BusinessDays: String {
    case sun = "sunday"
    case monday = "monday"
}

enum BusinessHourTypes: String {
    case to = "to"
    case from = "from"
}

typealias BusinessHourModel = [String:[String:String]]
