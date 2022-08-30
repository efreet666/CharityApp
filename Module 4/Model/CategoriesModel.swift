//
//  CategoriesModel.swift
//  Module 4
//
//  Created by Влад Бокин on 30.08.2022.
//

import Foundation

// MARK: - CategoriesModelElement
struct CategoriesModelElement: Codable {
    let id, title: String?
}

typealias CategoriesModel = [CategoriesModelElement]
