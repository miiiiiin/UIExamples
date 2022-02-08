//
//  UITableView+Identifiable.swift
//  StickyTableView
//
//  Created by Running Raccoon on 2022/02/08.
//

import UIKit

extension UITableView {

    func register<T: UITableViewCell>(cellType: T.Type) where T: ClassIdentifiable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseId)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self) -> T where T: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseId) as? T
            else { fatalError("Couldn't dequeue a UITableViewCell with identifier: \(type.reuseId)") }
        return cell
    }

    func dequeueResuableCell<T: UITableViewCell>(withCellType type: T.Type = T.self, forIndexPath indexPath: IndexPath) -> T where T: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseId, for: indexPath) as? T
            else { fatalError("Couldn't dequeue a UITableViewCell with identifier: \(type.reuseId)") }
        return cell
    }
}
