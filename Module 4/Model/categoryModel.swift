//
//  categoryModel.swift
//  Module 4
//
//  Created by Влад Бокин on 20.08.2022.
//

import UIKit

struct CategoryModel {
    let image: UIImage?
    let text: String
}


// MARK: - Data

var categoryData: [CategoryModel] = [
    CategoryModel(image: UIImage(named: "category1"), text: "Дети"),
    CategoryModel(image: UIImage(named: "category2"), text: "Взрослые"),
    CategoryModel(image: UIImage(named: "category3"), text: "Пожилые"),
    CategoryModel(image: UIImage(named: "category4"), text: "Животные"),
    CategoryModel(image: UIImage(named: "category5"), text: "Мероприятия")
]
