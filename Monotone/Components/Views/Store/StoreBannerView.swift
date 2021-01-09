//
//  StoreBannerView.swift
//  Monotone
//
//  Created by Xueliang Chen on 2021/1/10.
//

import UIKit

import SnapKit
import HMSegmentedControl

import RxSwift
import RxCocoa
import RxSwiftExt

class StoreBannerView: BaseView {
    
    // MARK: - Public
    public let storeItem: BehaviorRelay<StoreItem?> = BehaviorRelay<StoreItem?>(value: nil)

    // MARK: - Controls
    private var titleLabel: UILabel!
    private var coverImageView: UIImageView!
    private var stateLabel: UILabel!
    private var priceLabel: UILabel!
    
    // MARK: - Private
    private let disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    override func buildSubviews() {
        super.buildSubviews()
        
        //
        
        // CoverImageView.
        self.coverImageView = UIImageView()
        self.coverImageView.backgroundColor = UIColor.orange
        self.coverImageView.contentMode = .scaleAspectFill
        self.addSubview(self.coverImageView)
        self.coverImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(14.0)
            make.top.equalTo(self).offset(12.0)
            make.right.bottom.equalTo(self)
        }
        
        // TitleLabel.
        self.titleLabel = UILabel()
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        self.titleLabel.numberOfLines = 0
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(15.0)
            make.bottom.equalTo(self).offset(-12.0)
            make.right.equalTo(self.snp.centerY)
        })
        
        // StateLabel.
        self.stateLabel = UILabel()
        self.stateLabel.textColor = UIColor.white
        self.stateLabel.font = UIFont.systemFont(ofSize: 12)
        self.stateLabel.backgroundColor = UIColor.gray
        self.addSubview(self.stateLabel)
        self.stateLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(self)
            make.left.equalTo(self).offset(6.0)
        })
        
        // PriceLabel.
        self.priceLabel = UILabel()
        self.priceLabel.textColor = UIColor.white
        self.priceLabel.font = UIFont.systemFont(ofSize: 14)
        self.priceLabel.backgroundColor = UIColor.gray
        self.addSubview(self.priceLabel)
        self.priceLabel.snp.makeConstraints({ (make) in
            make.right.equalTo(self).offset(-17.0)
            make.bottom.equalTo(self).offset(-21.0)
        })
    }
    
    override func buildLogic() {
        super.buildLogic()
        
        // Bindings.
        // SegmentedControl
        self.storeItem
            .unwrap()
            .subscribe(onNext: { [weak self] (item) in
                guard let self = self else { return }
                
                self.coverImageView.image = item.coverImage
                self.titleLabel.text = item.title
                self.stateLabel.text = item.state
                self.priceLabel.text = "$\(item.price ?? 999.0)"
            })
            .disposed(by: self.disposeBag)
    }
}