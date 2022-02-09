//
//  PersonTableViewCell.swift
//  StickyTableView
//
//  Created by Running Raccoon on 2022/02/08.
//

import UIKit

class PersonTableViewCell: StickyTableViewCell {
    
    lazy var iconView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        
        [iconView, titleLabel, detailLabel].forEach(contentView.addSubview(_:))
        
        iconView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.height.equalTo(28)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(iconView.snp.right).offset(8)
            make.trailing.equalToSuperview()
            make.height.equalTo(18)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalToSuperview()
            make.height.equalTo(14)
        }
    }
    
    func bind(data: PersonRow) {
        iconView.image = UIImage(named: data.person)
        titleLabel.text = data.title
        detailLabel.text = data.detail
    }
}
