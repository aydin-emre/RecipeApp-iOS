//
//  BaseViewController.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import UIKit

class BaseViewController: UIViewController {

    var alert: Alert!

    func initialSetup() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        alert = Alert()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
