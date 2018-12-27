//
//  MainBeerListViewController.swift
//  app_beer
//
//  Created by Rodrigo Vianna on 27/12/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class MainBeerListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: MainBeerListDataSource?
    
    var beers = [Beer]() {
        didSet {
            loadBeers(beers)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func loadBeers(_ beers: [Beer]) {
        receiveBeers(beers)
        self.tableView.reloadData()
    }
    
    func receiveBeers(_ beers: [Beer]) {
        let source = MainBeerListDataSource(tableView: tableView, beers: beers)
        applyDataSource(source: source)
    }
    
    func applyDataSource(source: MainBeerListDataSource) {
        source.delegate = self
        self.dataSource = source
    }
}

extension MainBeerListViewController: MainBeerListDataSourceDelegate {
    func mainBeerListDataSource(_ ds: MainBeerListDataSource, didSelect beer: Beer) {
        
    }
}
