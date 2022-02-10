//
//  CollectionsCollectionViewCell.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import UIKit
import SDWebImage

final class CollectionsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cardView: CardView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.round(radius: 16, masksToBounds: true)
    }

    func configure(with collection: Collection) {
        if let previewImageUrls = collection.previewImageUrls {
            let previewImageUrlsCount = previewImageUrls.count
            let arrayCount = min(self.cardView.cardViewImages.count, previewImageUrlsCount)
            for i in 0..<arrayCount {
                if let url = URL(string: previewImageUrls[i]) {
                    self.cardView.cardViewImages[i].sd_setImage(with: url)
                }
            }
        }
        cardView.titleLabel.text = collection.title
        cardView.descriptionLabel.text = collection.collectionDescription
        if let recipeCount = collection.recipeCount {
            cardView.recipeCount = recipeCount
        }
    }

}
