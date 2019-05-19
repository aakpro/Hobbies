//
//  ListDetailModelProtocol.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/19/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import UIKit

protocol ListDetailModelProtocol: ListModelProtocol
{
    var photo: String? { get set }
    var addresses: [AddressModel]? { get set }
    var businessHours: [BusinessHourModel]? { get set }
    var contactInfo: [ContactInfoModel]? { get set }
}
