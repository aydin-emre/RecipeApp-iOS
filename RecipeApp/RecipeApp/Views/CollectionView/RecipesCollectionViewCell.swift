//
//  RecipesCollectionViewCell.swift
//  RecipeApp
//
//  Created by Emre on 28.01.2022.
//

import UIKit
import SDWebImage

class RecipesCollectionViewCell: UICollectionViewCell {

    @IBOutlet var recipeView: RecipeView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.round(radius: 16, masksToBounds: true)
    }

    func configure(with recipe: Recipe) {
        if let imageURL = recipe.imageURL,
           let url = URL(string: imageURL) {
            self.recipeView.imageView.sd_setImage(with: url,
                                                  placeholderImage: UIImage(named: "preview"),
                                                  options: .continueInBackground) { _, _, _ in
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.recipeView.activityIndicator.startAnimating()
                }
            } completed: { _, _, _, _ in
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.recipeView.activityIndicator.stopAnimating()
                }
            }
        }
        if let imageURL = recipe.user?.imageURL,
           let url = URL(string: imageURL) {
            self.recipeView.userImageView.sd_setImage(with: url)
        }
        recipeView.titleLabel.text = recipe.title
        recipeView.descriptionLabel.text = recipe.story
        recipeView.usernameLabel.text = recipe.user?.name
    }

}
