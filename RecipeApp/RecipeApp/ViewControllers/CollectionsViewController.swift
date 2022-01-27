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

    let collectionsViewModel = CollectionsViewModel()
    let disposeBag = DisposeBag()

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
        let width = (view.frame.size.width) - 16
        let height = width + 120
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
