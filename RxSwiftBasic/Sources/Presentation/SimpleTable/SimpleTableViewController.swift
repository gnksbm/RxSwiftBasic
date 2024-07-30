//
//  SimpleTableViewController.swift
//  RxSwiftBasic
//
//  Created by gnksbm on 7/30/24.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class SimpleTableViewController: UIViewController {
    private let viewModel = SimpleTableViewModel()
    
    private var disposeBag = DisposeBag()
    
    private let tableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        bind()
    }
    
    private func bind() {
        let output = viewModel.bind(
            input: SimpleTableViewModel.Input(
                viewWillAppearEvent: rx.viewWillAppearEvent.map { _ in },
                itemSelectEvent: tableView.rx.modelSelected(Int.self)
                    .asObservable(),
                accessoryButtonTapEvent: tableView.rx.itemAccessoryButtonTapped
                    .asObservable()
            )
        )
        
        disposeBag.store {
            output.tableViewItems
                .bind(to: tableView.rx.items) { tableView, index, item in
                    let cell = UITableViewCell(
                        style: .default,
                        reuseIdentifier: "Cell"
                    )
                    cell.textLabel?.text = "\(item)"
                    cell.accessoryType = .detailButton
                    return cell
                }
            
            output.showTapAlert
                .bind(with: self) { vc, item in
                    vc.showAlert(
                        title: "아이템 탭",
                        message: "선택한 Item: \(item)"
                    )
                }
            
            output.showDetailAlert
                .bind(with: self) { vc, item in
                    vc.showAlert(
                        title: "악세사리 탭",
                        message: "선택한 IndexPath: \(item)"
                    )
                }
        }
    }
    
    private func configureLayout() {
        tableView.snp.equalToSafeArea(view)
    }
}
