//
//  TableViewCellExtension.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/18/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import UIKit

extension UITableViewCell
{
    internal static func registerSelf(inTableView tableView:UITableView)
    {
        let nibName = String(describing: self)
        tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: self.reusableIdentifier)
    }
    
    internal static var reusableIdentifier: String
    {
        get{
            return String(describing: self)
        }
    }
}
