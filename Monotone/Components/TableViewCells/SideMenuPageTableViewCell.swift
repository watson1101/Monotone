//
//  SideMenuPageTableViewCell.swift
//  Monotone
//
//  Created by Xueliang Chen on 2020/12/18.
//

import UIKit

import RxSwift
import RxRelay
import RxSwiftExt

class SideMenuPageTableViewCell: UITableViewCell {
    
    // MARK: - Public
    public var page: BehaviorRelay<SideMenuPage?> = BehaviorRelay<SideMenuPage?>(value: nil)

    // MARK: - Controls
    public var titleLabel: UILabel!
    
    // MARK: - Private
    private let disposeBag: DisposeBag = DisposeBag()
    
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
        self.backgroundColor = UIColor.clear
            
        // PhotoCountLabel.
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
        
        // Bindings.
        // Page.
        self.page
            .unwrap()
            .flatMap { (page) -> Observable<String> in
                return Observable.just(page.rawValue.description)
            }
            .bind(to: self.titleLabel.rx.text)
            .disposed(by: self.disposeBag)
            
    }
}
