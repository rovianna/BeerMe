//
//  MainBeerListDataSource.swift
//  app_beer
//
//  Created by Rodrigo Vianna on 27/12/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

protocol MainBeerListDataSourceDelegate {
    func mainBeerListDataSource(_ ds: MainBeerListDataSource, didSelect beer: Beer)
}

class MainBeerListDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var tableView: UITableView?
    
    var beers = [Beer]() {
        didSet {
            onMain {
                self.tableView?.reloadData()
            }
        }
    }
    
    var delegate: MainBeerListDataSourceDelegate?
    
    init(tableView: UITableView, beers: [Beer]) {
        super.init()
        self.beers = beers
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView = tableView
    }
    
    func onMain(block: @escaping ()-> ()){
        DispatchQueue.main.async {
            block()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beer = beers[indexPath.row]
        delegate?.mainBeerListDataSource(self, didSelect: beer)
    }
}
