//
//  CategoryTableViewCell.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/18/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell
{

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            self.descriptionLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var category: CategoryModel! {
        didSet
        {
            nameLabel.text = category.title
            descriptionLabel.text = category.description
            if let dateText = category.createdAt?.convert(toStyle: .full) {
                dateLabel.text = "created at: \(dateText)"
            }
        }
    }
}

