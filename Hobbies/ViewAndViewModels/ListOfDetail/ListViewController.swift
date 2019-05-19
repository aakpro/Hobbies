//
//  ListViewController.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/19/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

//sample without rxswift

class ListViewController: UIViewController
{
    private var viewModel: ListOfDetailsViewModel!
    var listData = Array<ListModelProtocol>()
    var hobbieType: HobbiesTypes!{
        didSet {
            self.viewModel = ListOfDetailsViewModel(viewController: self)
            self.viewModel.type = self.hobbieType
        }
    }
    var category: CategoryModel! {
        didSet {
            self.title = category.title
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    private func setupTableView()
    {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        ListModelTableViewCell.registerSelf(inTableView: tableView)
        self.removeTableViewExtraEmptyCells(tableView: self.tableView)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupTableView()
    }
}

extension ListViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listModel = self.listData[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: ListModelTableViewCell.reusableIdentifier, for: indexPath) as? ListModelTableViewCell {
            cell.listModel = listModel
            return cell
        }
        fatalError("can't deque cell")
    }
    
    
}
extension ListViewController: UITableViewDelegate
{
}
