//
//  RecipesViewController.swift
//  RecipeApp
//
//  Created by Emre on 28.01.2022.
//

import UIKit
import RxSwift
import RxCocoa

class RecipesViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private let recipesViewModel: RecipesViewModel
    private let disposeBag = DisposeBag()

    // MARK: - Initialization

    init?(coder: NSCoder, viewModel: RecipesViewModel) {
        self.recipesViewModel = viewModel
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        recipesViewModel = RecipesViewModel()
        super.init(coder: coder)
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBindings()
        recipesViewModel.requestData()
    }

    func setupBindings() {
        // Error Handling
        recipesViewModel
            .error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { error in
                self.alert.setMessage(error)
                self.alert.show()
            })
            .disposed(by: disposeBag)

        // Cards CollectionView
        recipesViewModel
            .recipes
            .observe(on: MainScheduler.instance)
            .bind(to: collectionView
                    .rx
                    .items(cellIdentifier: "RecipesCollectionViewCell", cellType: RecipesCollectionViewCell.self)) { _, element, cell in
                cell.configure(with: element)
            }
            .disposed(by: disposeBag)

        let flowLayout = UICollectionViewFlowLayout()
        let width = view.frame.size.width - 8
        let height = view.frame.size.height / 6
        flowLayout.itemSize = CGSize(width: width, height: height)
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
    }

}
