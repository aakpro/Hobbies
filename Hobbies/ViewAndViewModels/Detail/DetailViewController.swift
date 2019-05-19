//
//  DetailViewController.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/19/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import UIKit

//The third way

class DetailViewController: UIViewController {

    var viewModel: DetailViewModel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
extension DetailViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfItems(in: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
