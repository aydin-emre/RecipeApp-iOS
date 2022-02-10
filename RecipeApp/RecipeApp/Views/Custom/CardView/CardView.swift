//
//  CardView.swift
//  NewsApp
//
//  Created by Emre on 26.12.2021.
//

import UIKit

final class CardView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!
    @IBOutlet var imageView4: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var recipeCountContainerView: UIView!
    @IBOutlet var recipeCountLabel: UILabel!

    lazy var cardViewImages: [UIImageView] = {
       return [imageView1, imageView2, imageView3, imageView4]
    }()

    var recipeCount: Int = 0 {
        didSet {
            recipeCountLabel.text = "\(recipeCount) Recipes"
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        for cardViewImage in cardViewImages {
            cardViewImage.addBorder(color: .white, radius: 0, borderWidth: 1)
        }
        recipeCountContainerView.round()
    }

}
