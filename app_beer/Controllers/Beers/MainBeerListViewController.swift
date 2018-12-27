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
    
    let requester = BeerRequester()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = UITableView.automaticDimension
        requestRemoteBeerRepository()
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
    
    func requestLocalBeerRepository() {
        let localRepository = LocalBeerRepository()
        localRepository.getAllBeers { (result) in
            switch result {
            case .success(let data):
                self.beers = data
            case .failure(let error):
                self.showErrorAlert(title: "Erro", message: error.localizedDescription)
            }
        }
    }
    
    func requestRemoteBeerRepository() {
        let remoteRepository = RemoteBeerRepository()
        remoteRepository.getAllBeers { (result) in
            switch result {
            case .success(let data):
                self.beers = data
            case .failure(let error):
                self.showErrorAlert(title: "Erro", message: error.localizedDescription)
            }
        }
    }
    
}

extension MainBeerListViewController: MainBeerListDataSourceDelegate {
    func mainBeerListDataSource(_ ds: MainBeerListDataSource, didSelect beer: Beer) {
        let vc = BeerDetailViewController.instance
        vc.beer = beer
        present(vc, animated: true, completion: nil)
    }
}
