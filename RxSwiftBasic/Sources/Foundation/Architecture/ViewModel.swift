//
//  ViewModel.swift
//  RxSwiftBasic
//
//  Created by gnksbm on 7/30/24.
//

import Foundation

import RxSwift

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    var initialOutput: Output { get set }
    var disposeBag: DisposeBag { get set }
    
    @DisposableBuilder
    func transform(
        input: Input,
        output: Output
    ) -> [Disposable]
}

extension ViewModel {
    func bind(input: Input) -> Output {
        transform(input: input, output: initialOutput).forEach {
            $0.disposed(by: disposeBag)
        }
        return initialOutput
    }
}
