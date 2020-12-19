//
//  SideMenuOptionTableViewCell.swift
//  Monotone
//
//  Created by Xueliang Chen on 2020/12/18.
//

import UIKit

class SideMenuOptionTableViewCell: UITableViewCell {
    
    // MARK: Public
    

    // MARK: Controls
    public var titleLabel: UILabel!
    
    // MARK: Private
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.buildSubviews()
        self.buildLogic()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildSubviews(){
        
        self.selectionStyle = .none
            
        // photoCountLabel.
        self.titleLabel = UILabel()
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 26)
        self.titleLabel.textColor = ColorPalette.colorBlack
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.contentView)
            make.centerY.equalTo(self.contentView)
        })
    }

    private func buildLogic(){
        
        // Bindings
    }
}