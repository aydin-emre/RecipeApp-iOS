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

    let collectionsViewModel = CollectionsViewModel()
    let disposeBag = DisposeBag()
    var collection: Collection?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBindings()
        if let collectionId = collection?.id {
            collectionsViewModel.requestData(with: collectionId)
        }
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

        // CollectionView Selections
        collectionView
            .rx
            .modelSelected(Collection.self)
            .subscribe(onNext: { [unowned self] model in
                print(model)
//                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                if let headlinesViewController = storyBoard.instantiateViewController(withIdentifier: "CardDetailViewController")
//                    as? CardDetailViewController {
//                    headlinesViewController.card = model
//                    self.navigationController?.pushViewController(headlinesViewController, animated: true)
//                }
            }).disposed(by: disposeBag)
    }

}
