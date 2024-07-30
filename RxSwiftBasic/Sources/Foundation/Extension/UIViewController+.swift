//
//  UIViewController+.swift
//  RxSwiftBasic
//
//  Created by gnksbm on 7/30/24.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

extension UIViewController {
    var safeArea: UILayoutGuide {
        view.safeAreaLayoutGuide
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
