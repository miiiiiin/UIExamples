//
//  TableViewController.swift
//  StickyTableView
//
//  Created by Running Raccoon on 2022/02/08.
//

import Foundation
import UIKit
import SnapKit

class TableViewController: UIViewController {
    fileprivate var viewDidAppear = false
    fileprivate var sections = [Section]()
    fileprivate var pointersForHeader = [IndexPath : IndexPath]() // key = starting point, value = ending point
    fileprivate var stickyReference = [IndexPath]() // value = sections object index path
    fileprivate var heightDict = [IndexPath : CGFloat]() // key = index path, value = cell's height
    fileprivate var minVisibleIndexPath = IndexPath.zero
    fileprivate var maxVisibleIndexPath = IndexPath.zero
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    lazy var stickyTableView: StickyTableView = {
        let tv = StickyTableView()
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Review"
        configureLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppear = true
    }
    
    func configureLayout() {
        [tableView, stickyTableView].forEach(view.addSubview(_:))
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(stickyTableView.snp.top)
        }
        
        stickyTableView.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        register(cellTypes: [StandardTableViewCell.self, PersonTableViewCell.self])
        
        loadData(file: "data1")
    }
    
    // MARK: - Prepare data
    /// Register all nib cells that should be use for the table view.
    ///
    /// DO NOT add the dequeue reusable cell directly on the table view in interface builder because the table view cell is used in both main table view and sticky table view
    /// - Parameter nibCells: The list of table view nibs with identifiers for table view
    func register(cellTypes: [UITableViewCell.Type]) {
        for cellType in cellTypes {
            tableView.register(cellType: cellType)
            stickyTableView.register(cellType: cellType)
        }
    }
    
    private func loadData(file: String) {
        title = file
        if let url = Bundle.main.url(forResource: file, withExtension: "json"),
            let data = (try? Data(contentsOf: url)),
            let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String : Any]] {
            sections = json.map { Section(json: $0) }
//            resetAndUpdateReferencePointers()
        }
    }
}


// MARK: - UITableViewDataSource

extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableView == self.tableView ? sections.count : 1 // sticky table view always has single section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == self.tableView ? sections[section].numberOfFlattenRows() : stickyReference.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
//        return UITableViewCell()
        // use sticky reference conversion to find the reference index path when displaying sticky table view
        let useIndexPath = tableView == self.tableView ? indexPath : (stickyReference[indexPath.row])

        let item = sections[useIndexPath.section].get(flattenRowAt: useIndexPath.row)

        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath)
//        if let vehicleCell = cell as? VehicleTableViewCell, let data = item as? VehicleRow {
//            vehicleCell.bind(data: data)
//        }
//        else if let personCell = cell as? PersonTableViewCell, let data = item as? PersonRow {
//            personCell.bind(data: data)
//        }
//        else
        
        if let standardCell = cell as? StandardTableViewCell, let data = item as? StandardRow {
            standardCell.bind(data: data)
        }
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension TableViewController: UITableViewDelegate {
    
    
}
