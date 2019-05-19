//
//  DateExtension.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/18/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import UIKit
import Foundation

extension Date
{
    func convert(toStyle style:DateFormatter.Style) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
}
