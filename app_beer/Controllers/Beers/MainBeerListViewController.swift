//
//  MainBeerListViewController.swift
//  app_beer
//
//  Created by Rodrigo Vianna on 27/12/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

fileprivate let userDefaults = UserDefaults.standard

class MainBeerListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: MainBeerListDataSource? {
        didSet {
            loadingView.stopAnimating()
            view.bringSubviewToFront(tableView)
        }
    }
    
    var beers = [Beer]() {
        didSet {
            loadBeers(beers)
        }
    }
    
    let requester = BeerRequester()
    let loadingView = LoadingView.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loadingView)
        loadingView.startAnimating()
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = 150
        requestBeers()
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
            case .failure( _):
                self.loadBlankState()
            }
        }
    }
    
    func requestRemoteBeerRepository() {
        let remoteRepository = RemoteBeerRepository()
        remoteRepository.getAllBeers { (result) in
            switch result {
            case .success(let data):
                self.beers = data
                do {
                    let encodedData = try NSKeyedArchiver.archivedData(withRootObject: self.beers, requiringSecureCoding: false)
                    userDefaults.set(encodedData, forKey: "beers")
                } catch {
                    self.loadBlankState()
                }
            case .failure( _):
                self.loadBlankState()
            }
        }
    }
    
    func requestBeers() {
        if userDefaults.object(forKey: "beers") != nil {
            requestLocalBeerRepository()
        } else {
            requestRemoteBeerRepository()
        }
    }
    
    func loadBlankState() {
        let blankState = BlankState.instance
        view.addSubview(blankState)
        view.bringSubviewToFront(blankState)
        blankState.titleLabel.text = "Ops!"
        blankState.descriptionLabel.text = "Uma de nossas cervejas caiu, estamos limpando o mais rápido possível!"
        blankState.errorButton.setTitle("Tentar Novamente", for: .normal)
        blankState.action = { _ in
            self.requestBeers()
        }
    }
    
}

extension MainBeerListViewController: MainBeerListDataSourceDelegate {
    func mainBeerListDataSource(_ ds: MainBeerListDataSource, didSelect beer: Beer) {
        DispatchQueue.main.async {
            let vc = BeerDetailViewController.instance
            vc.beer = beer
            self.present(vc, animated: true, completion: nil)
        }
    }
}
