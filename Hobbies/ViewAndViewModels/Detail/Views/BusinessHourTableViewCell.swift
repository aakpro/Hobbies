//
//  BusinessHourTableViewCell.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/19/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import UIKit

class BusinessHourTableViewCell: UITableViewCell {
    @IBOutlet weak var theLabel: UILabel!
    var hour: DetailToListModel.BusinessHours! {
        didSet {
            self.theLabel.text = "\(self.hour.day):        from \(self.hour.from) - to \(self.hour.to)"
        }
    }
}
