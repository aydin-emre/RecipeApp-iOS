//
//  RecipesViewController.swift
//  RecipeApp
//
//  Created by Emre on 28.01.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class RecipesViewController: BaseViewController {

    @IBOutlet var collectionView: UICollectionView!

    private let recipesViewModel: RecipesViewModel
    private let disposeBag = DisposeBag()
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        let width = view.frame.size.width - 8
        let height = view.frame.size.height / 6
        flowLayout.itemSize = CGSize(width: width, height: height)
        return flowLayout
    }()

    // MARK: - Initialization

    init?(coder: NSCoder, viewModel: RecipesViewModel) {
        self.recipesViewModel = viewModel
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        recipesViewModel = RecipesViewModel(recipesProtocol: NetworkRecipesRepository())
        super.init(coder: coder)
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.title = ViewControllerTitles.recipes
        // Do any additional setup after loading the view.
        setupBindings()
        recipesViewModel.requestData()
    }

    private func setupBindings() {
        // Error Handling
        recipesViewModel
            .error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [unowned self] error in
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

        collectionView.setCollectionViewLayout(flowLayout, animated: true)

        // For Categories CollectionView Animation
        collectionView
            .rx
            .willDisplayCell
            .subscribe(onNext: ({ cell, _ in
                cell.alpha = 0
                let transform = CATransform3DTranslate(CATransform3DIdentity, 23, 0, 23)
                cell.layer.transform = transform
                UIView.animate(withDuration: 0.9,
                               delay: 0,
                               usingSpringWithDamping: 0.7,
                               initialSpringVelocity: 0.5,
                               options: .curveEaseOut,
                               animations: {
                    cell.alpha = 1
                    cell.layer.transform = CATransform3DIdentity
                }, completion: nil)
            })).disposed(by: disposeBag)
    }

}
