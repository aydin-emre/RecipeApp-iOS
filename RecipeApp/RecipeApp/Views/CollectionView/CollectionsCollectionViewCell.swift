//
//  CollectionsCollectionViewCell.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import UIKit
import SDWebImage

class CollectionsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cardView: CardView!

    override func awakeFromNib() {
        super.awakeFromNib()
//        self.round()
//        self.addBorder(color: .black, radius: 8, borderWidth: 0.5)
    }

    func configure(with collection: Collection) {
        DispatchQueue.global(qos: .background).async {
            if let previewImageUrls = collection.previewImageUrls {
                let previewImageUrlsCount = previewImageUrls.count
                let arrayCount = min(self.cardView.cardViewImages.count, previewImageUrlsCount)
                for i in 0..<arrayCount {
                    if let url = URL(string: previewImageUrls[i]) {
                        DispatchQueue.main.async {
                            self.cardView.cardViewImages[i].sd_setImage(with: url)
                        }
                    }
                }
            }
        }
        cardView.titleLabel.text = collection.title
        cardView.descriptionLabel.text = collection.collectionDescription
    }

}
