//
//  ViewController.swift
//  GPSUI
//
//  Created by Gilson Santos on 17/09/21.
//

import UIKit

open class ViewController: UIViewController {
    public enum ButtonNavigationType {
        case add
    }

    public enum ButtonItemPosition {
        case right
        case left
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationColor()
    }

    private func setupNavigationColor() {
        navigationController?.navigationBar.barTintColor = DesignSystemApp.shared.designSystem.navigation.backgroundColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: DesignSystemApp.shared.designSystem.navigation.tintColor]
    }

    public func setTitle(title: String) {
        navigationController?.navigationBar.topItem?.title = title
    }

    public func addNavigationButton(type: ButtonNavigationType, target: Selector, position: ButtonItemPosition) {
        let button = createButtonBar(type: getSystemItem(to: type), target: target)
        if position == .right {
            navigationItem.rightBarButtonItem = button
        } else {
            navigationItem.leftBarButtonItems = [button]
        }

    }

    private func getSystemItem(to type: ButtonNavigationType) -> UIBarButtonItem.SystemItem {
        switch type {
        case .add:
            return .add
        }
    }

    private func createButtonBar(type: UIBarButtonItem.SystemItem, target: Selector) -> UIBarButtonItem {
        let button = UIBarButtonItem(barButtonSystemItem: type, target: self, action: target)
        button.tintColor = DesignSystemApp.shared.designSystem.navigation.tintColor
        return button
    }
}
