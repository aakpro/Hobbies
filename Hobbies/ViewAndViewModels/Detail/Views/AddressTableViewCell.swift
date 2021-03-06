//
//  AddressTableViewCell.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/19/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    var address: AddressModel! {
        didSet {
            if let addr = self.address {
                self.addressLabel.text = "\(addr.country ?? "") - \(addr.city ?? "") - \(addr.address1 ?? "")"
            }
        }
    }
    @IBOutlet weak var addressLabel: UILabel!
}
