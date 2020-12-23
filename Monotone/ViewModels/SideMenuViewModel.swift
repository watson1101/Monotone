//
//  SideMenuViewModel.swift
//  Monotone
//
//  Created by Xueliang Chen on 2020/12/21.
//

import Foundation

import RxSwift
import RxRelay
import Action

class SideMenuViewModel: BaseViewModel, ViewModelStreamable{
    
    // MARK: - Input
    struct Input {
        var pages: BehaviorRelay<[(key:SideMenuPage, value:String)]?> = BehaviorRelay<[(key:SideMenuPage, value:String)]?>(value: nil)
    }
    public var input: Input = Input()
    
    // MARK: - Output
    struct Output {
        var pages: BehaviorRelay<[(key:SideMenuPage, value:String)]?> = BehaviorRelay<[(key:SideMenuPage, value:String)]?>(value: nil)
    }
    public var output: Output = Output()
    
    // MARK: - Private
    //
    
    // MARK: - Inject
    override func inject(args: [String : Any]?) {

    }
    
    // MARK: - Bind
    override func bind() {
        
        // Service.
        let userService = self.service(type: UserService.self)!
        
        // Bindings.
        self.input.pages
            .subscribe { (keyValuePairs) in
                self.output.pages.accept(keyValuePairs)
            }
            .disposed(by: self.disposeBag)

        
    }
    
}
