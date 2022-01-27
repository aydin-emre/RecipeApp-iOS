//
//  HomeViewController.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkManager.shared.getAllRecipes { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                break
            }
        }
    }

}
