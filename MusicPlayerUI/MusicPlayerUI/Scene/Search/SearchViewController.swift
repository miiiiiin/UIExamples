//
//  SearchViewController.swift
//  MusicPlayerUI
//
//  Created by Running Raccoon on 2021/10/06.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUpTable() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: SearchCell.cellId)
//        tableView.tableFooterView = footer
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //fixme
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell() //fixme
    }
}
