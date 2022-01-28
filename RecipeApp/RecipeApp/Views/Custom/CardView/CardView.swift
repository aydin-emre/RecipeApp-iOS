//
//  CardView.swift
//  NewsApp
//
//  Created by Emre on 26.12.2021.
//

import UIKit

class CardView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var recipeCountContainerView: UIView!
    @IBOutlet weak var recipeCountLabel: UILabel!

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

    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        for cardViewImage in cardViewImages {
            cardViewImage.addBorder(color: .white, radius: 0, borderWidth: 1)
        }
        recipeCountContainerView.round()
        recipeCountContainerView.addBorder(color: appColor, radius: 8, borderWidth: 0.5)
    }

}
