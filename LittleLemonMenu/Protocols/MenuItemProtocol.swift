//
//  MenuItemProtocol.swift
//  LittleLemonMenu
//
//  Created by Rustem Orazbayev on 12.02.2023.
//

import Foundation

protocol MenuItemProtocol: Identifiable {
    var title: String { get }
    var ingridients: [Ingridients] { get }
    var type: FoodCategories { get }
    var price: Double { get set }
    var ordersCount: Int { get set }
    var id: UUID { get }
}
