//
//  Snapkit+.swift
//  RxSwiftBasic
//
//  Created by gnksbm on 7/30/24.
//

import UIKit

import SnapKit

extension ConstraintViewDSL {
    func equalTo(_ superView: UIView) {
        guard let view = target as? UIView else { return }
        superView.addSubview(view)
        
        makeConstraints { make in
            make.edges.equalTo(superView)
        }
    }
    
    func equalToSafeArea(_ superView: UIView) {
        guard let view = target as? UIView else { return }
        superView.addSubview(view)
        
        makeConstraints { make in
            make.edges.equalTo(superView.safeAreaLayoutGuide)
        }
    }
}
