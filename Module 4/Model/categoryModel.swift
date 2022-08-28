//
//  categoryModel.swift
//  Module 4
//
//  Created by Влад Бокин on 20.08.2022.
//

import UIKit.UIImage
import Rswift

struct CategoryModel {
    let image: UIImage?
    let text: String
}

// MARK: - Data

let categoryData: [CategoryModel] = [
    CategoryModel(image: R.image.childCategoty(), text: R.string.localizable.childCategory()),
    CategoryModel(image: R.image.adultCategoty(), text: R.string.localizable.adultCategory()),
    CategoryModel(image: R.image.oldCategoty(), text: R.string.localizable.oldCategory()),
    CategoryModel(image: R.image.animalsCategoty(), text: R.string.localizable.animalsCategory()),
    CategoryModel(image: R.image.eventCategoty(), text: R.string.localizable.eventCategory())
]
