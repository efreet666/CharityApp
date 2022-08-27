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
    CategoryModel(image: R.image.childCategoty(), text: "Дети"),
    CategoryModel(image: R.image.adultCategoty(), text: "Взрослые"),
    CategoryModel(image: R.image.oldCategoty(), text: "Пожилые"),
    CategoryModel(image: R.image.animalsCategoty(), text: "Животные"),
    CategoryModel(image: R.image.eventCategoty(), text: "Мероприятия")
]
