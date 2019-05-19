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

    private var viewModel: DetailViewModel!
    var detailModel: ListDetailModelProtocol! {
        didSet{
            self.viewModel = DetailViewModel(viewController: self)
            self.viewModel.detailObject = self.detailModel
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.setupTableView()
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    func setupTableView()
    {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.removeTableViewExtraEmptyCells(tableView: self.tableView)
        TitleAndDescTableViewCell.registerSelf(inTableView: self.tableView)
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
        if let item = self.viewModel.item(at: indexPath) {
            switch item{
                
            case .titleAndDesc(let info):
                if let cell = tableView.dequeueReusableCell(withIdentifier: TitleAndDescTableViewCell.reusableIdentifier, for: indexPath) as? TitleAndDescTableViewCell {
                    cell.info = info
                    return cell
                }
                
            case .photo(let photo): break
                
            case .contactInformation(let contact): break
                
            case .addresses(let address): break
                
            case .businessHours(let businessHour): break
                
            }
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: TitleAndDescTableViewCell.reusableIdentifier, for: indexPath) as? TitleAndDescTableViewCell {
            return cell
        }
        fatalError("couldn't dequeue any cell in detail view controller")
    }
}

extension DetailViewController: UITableViewDelegate
{
    
}
