//
//  RxSwift+.swift
//  RxSwiftBasic
//
//  Created by gnksbm on 7/30/24.
//

import RxSwift

@resultBuilder
enum DisposableBuilder {
    static func buildBlock(_ components: Disposable...) -> [Disposable] {
        components
    }
}
