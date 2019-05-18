//
//  CategoryViewController.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/18/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CategoryViewController: UIViewController
{
    
    @IBOutlet weak var tableView: UITableView!
    private let disposeBag = DisposeBag()
    private let categories : PublishSubject<[CategoryModel]> = PublishSubject()
    private var viewModel = CategoryViewModel()

    public var tracks = PublishSubject<[CategoryModel]>()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Category"
        self.prepareTableView()
        self.setupTableViewBinding()
        self.setupBinding()
        self.viewModel.requestCategories()
    }
    
    private func prepareTableView()
    {
        CategoryTableViewCell.registerSelf(inTableView: self.tableView)
        self.removeTableViewExtraEmptyCells(tableView: self.tableView)
    }
    
    private func setupBinding ()
    {
        self.viewModel.loading
            .bind(to: self.rx.isLoading).disposed(by: disposeBag)

            viewModel
            .error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (error) in
                MessageUtility.show(error: error)
            })
            .disposed(by: disposeBag)


        viewModel
            .categories
            .observeOn(MainScheduler.instance)
            .bind(to: self.categories)
            .disposed(by: disposeBag)
    }
    
    private func setupTableViewBinding()
    {
        //binding cateogries to table view
        categories.bind(to: tableView.rx.items(cellIdentifier: CategoryTableViewCell.reusableIdentifier, cellType: CategoryTableViewCell.self)) {  (row, category, cell) in
            cell.category = category
            }.disposed(by: disposeBag)
        
        
        //simple animation
        tableView.rx.willDisplayCell
            .subscribe(onNext: ({ (cell,indexPath) in
                cell.alpha = 0
                let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
                cell.layer.transform = transform
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                    cell.alpha = 1
                    cell.layer.transform = CATransform3DIdentity
                }, completion: nil)
            })).disposed(by: disposeBag)
    }

}
