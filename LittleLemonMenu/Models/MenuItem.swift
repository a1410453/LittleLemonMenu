//
//  MenuItem.swift
//  LittleLemonMenu
//
//  Created by Rustem Orazbayev on 12.02.2023.
//

import Foundation

struct MenuItem: MenuItemProtocol {
    let title: String
    let ingridients: [Ingridients]
    let type: FoodCategories
    var price: Double
    var ordersCount: Int
    let id = UUID()
}
