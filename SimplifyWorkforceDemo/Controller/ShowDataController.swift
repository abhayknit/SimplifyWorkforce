//
//  ViewController.swift
//  SimplifyWorkforceDemo
//
//  Created by Abhay Pratap Singh on 22/09/22.
//

import UIKit

class ShowDataController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var tableView:UITableView!
    //MARK: Variables
    var viewModel:ShowDataViewModel?
    let activityIndicator = UIActivityIndicatorView.init(style: .large)
    
    
    
    //MARK: View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ConfigureUI()
    }
    
    
    func ConfigureUI(){
        self.navigationController?.isNavigationBarHidden = true
        self.viewModel = ShowDataViewModel()
        self.tableView.registerCell(Constant.cellIdentifier)
        self.tableView.delegate =  viewModel?.dataSource
        self.tableView.dataSource =  viewModel?.dataSource
        
        //Add activty indicator at Center of controller for first time api
        activityIndicator.center = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
        activityIndicator.color = UIColor.darkGray
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        //Add activty indicator at bottom
        viewModel?.dataSource.spinner.color = UIColor.darkGray
        viewModel?.dataSource.spinner.hidesWhenStopped = true
        tableView.tableFooterView = viewModel?.dataSource.spinner
        
        //Api Calling
        self.viewModel?.getDataFromServer(GAPIConstant.getDataApiUrl(viewModel?.dataSource.pageNumber ?? 1), { success, itemsData in
            if success == true {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            }
        })
        
        //Method For pagination
        self.viewModel?.handlePagination({ sucesss in
            if sucesss{
                self.viewModel?.dataSource.spinner.stopAnimating()
                self.tableView.reloadData()
            }
        })
        
    }
    
}



