//
//  SearchCell.swift
//  MusicPlayerUI
//
//  Created by Running Raccoon on 2021/10/06.
//

import Foundation
import UIKit

class SearchCell: UITableViewCell {
    
    static let cellId = "SearchCell"
    
    var viewModel: SearchCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        viewModel = SearchCellViewModel()
    }
}
