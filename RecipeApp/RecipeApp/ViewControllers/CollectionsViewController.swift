//
//  CollectionsViewController.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import UIKit
import RxSwift
import RxCocoa

class CollectionsViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private let collectionsViewModel = CollectionsViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBindings()
        collectionsViewModel.requestData()
    }

    func setupBindings() {
        // Error Handling
        collectionsViewModel
            .error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { error in
                self.alert.setMessage(error)
                self.alert.show()
            })
            .disposed(by: disposeBag)

        // Cards CollectionView
        collectionsViewModel
            .collections
            .observe(on: MainScheduler.instance)
            .bind(to: collectionView
                    .rx
                    .items(cellIdentifier: "CollectionsCollectionViewCell", cellType: CollectionsCollectionViewCell.self)) { _, element, cell in
                cell.configure(with: element)
            }
            .disposed(by: disposeBag)

        let flowLayout = UICollectionViewFlowLayout()
        let width = view.frame.size.width - 16
        let height = width + 120
        flowLayout.itemSize = CGSize(width: width, height: height)
        collectionView.setCollectionViewLayout(flowLayout, animated: true)

        // CollectionView Selections
        collectionView
            .rx
            .modelSelected(Collection.self)
            .subscribe(onNext: { [unowned self] model in
                print(model)
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyBoard.instantiateViewController(identifier: "RecipesViewController") { coder in
                    RecipesViewController(coder: coder, viewModel: RecipesViewModel(collectionId: model.id))
                }
                self.navigationController?.pushViewController(viewController, animated: true)
            }).disposed(by: disposeBag)
    }

}
