//
//  SimpleTableViewModel.swift
//  RxSwiftBasic
//
//  Created by gnksbm on 7/30/24.
//

import Foundation

import RxSwift

final class SimpleTableViewModel: ViewModel {
    var initialOutput = Output(
        tableViewItems: PublishSubject<[Int]>(),
        showTapAlert: PublishSubject<Int>(),
        showDetailAlert: PublishSubject<IndexPath>()
    )
    
    var disposeBag = DisposeBag()
    
    func transform(input: Input, output: Output) -> [Disposable] {
        input.viewWillAppearEvent
            .bind { _ in
                output.tableViewItems.onNext((0...100).map { $0 })
            }
        
        input.itemSelectEvent.bind(to: output.showTapAlert)
        input.accessoryButtonTapEvent.bind(to: output.showDetailAlert)
    }
    
    struct Input {
        let viewWillAppearEvent: Observable<Void>
        let itemSelectEvent: Observable<Int>
        let accessoryButtonTapEvent: Observable<IndexPath>
    }
    
    struct Output {
        let tableViewItems: PublishSubject<[Int]>
        let showTapAlert: PublishSubject<Int>
        let showDetailAlert: PublishSubject<IndexPath>
    }
}
