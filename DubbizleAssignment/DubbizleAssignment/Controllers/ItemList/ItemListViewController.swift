//
//  ItemListViewController.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import UIKit
import CoreData

class ItemListViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var itemTableView: UITableView!
    lazy var viewModel = ItemListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
        // Do any additional setup after loading the view.
        setUpTableView()
        setupBindingAndGetItems()
    }

    // MARK: - Helper Functions
    private func setUpTableView() {
        itemTableView.delegate = self
        itemTableView.dataSource = self
        itemTableView.tableFooterView = UIView(frame: CGRect.zero)
        itemTableView.register(nib: ItemListTableViewCell.name)
        // accessibilityIdentifier
        itemTableView.accessibilityIdentifier = "itemListTableView"
    }
    
    private func setupBindingAndGetItems() {
        //Binding
        viewModel.isBusy.bind { [unowned self] isBusy in
            if isBusy {
                CircleProgressView.showProgress(view: self.view, blockView: true)
            } else {
                CircleProgressView.hideProgress(view: self.view)
            }
        }
        
        viewModel.itemData.bind { [unowned self] (items) in
            if items != nil {
                self.itemTableView.reloadData()
            }
        }
        
        viewModel.error.bind { [unowned self] (error) in
            if let _ = error {
                print("APi load error")
            }
        }
        //Get Items
        viewModel.getItems()
    }
}
// MARK: - UITableView Data Source
extension ItemListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemListTableViewCell.name,
                                                       for: indexPath) as? ItemListTableViewCell else {
                                                        fatalError("Unable to dequeue ItemListTableViewCell.")
        }
        let model = viewModel.items[indexPath.row]
        cell.config(item: model)
        cell.accessibilityIdentifier = String(format: "itemTableViewCell_%ld_%ld", indexPath.section, indexPath.row)
        return cell
    }
}

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if viewModel.items.count > indexPath.row {
            let item = self.viewModel.items[indexPath.row]
            AppCoordinator.toItemDetail(item, navC: self.navigationController)
        }
    }
}

