//
//  PhotoTableViewCell.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/19/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoTableViewCell: UITableViewCell {
    @IBOutlet weak var detailImageView: UIImageView!
    
    var imageURL: String = "" {
        didSet {
            if let url = URL(string: self.imageURL) {
                self.detailImageView.kf.setImage(with: url)
            }
        }
    }
  
}
