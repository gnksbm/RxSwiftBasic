//
//  RxCocoa+.swift
//  RxSwiftBasic
//
//  Created by gnksbm on 7/30/24.
//

import UIKit

import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {
    var viewDidLoadEvent: Observable<[Any]> {
        methodInvoked(#selector(Base.viewDidLoad))
    }
    
    var viewWillAppearEvent: Observable<[Any]> {
        methodInvoked(#selector(Base.viewWillAppear))
    }
    
    var viewDidAppearEvent: Observable<[Any]> {
        methodInvoked(#selector(Base.viewDidAppear))
    }
    
    var viewWillDisappearEvent: Observable<[Any]> {
        methodInvoked(#selector(Base.viewWillDisappear))
    }
    
    var viewDidDisappearEvent: Observable<[Any]> {
        methodInvoked(#selector(Base.viewDidDisappear))
    }
}
