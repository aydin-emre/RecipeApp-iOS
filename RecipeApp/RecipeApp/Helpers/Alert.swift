//
//  Alert.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import UIKit
import EAAlert

class Alert: EAAlert {

    override var positiveButtonTextColor: UIColor {
        get {
            return Color.appColor
        }
        set {}
    }

    override var negativeButtonTextColor: UIColor {
        get {
            return Color.appColor
        }
        set {}
    }

    var posButtonText: String?
    override var positiveButtonText: String {
        get {
            return posButtonText ?? "Yes"
        }
        set {
            posButtonText = newValue
        }
    }

    var negButtonText: String?
    override var negativeButtonText: String {
        get {
            return negButtonText ?? "No"
        }
        set {
            negButtonText = newValue
        }
    }

}
