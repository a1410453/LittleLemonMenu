//
//  MenuViewModel.swift
//  LittleLemonMenu
//
//  Created by Rustem Orazbayev on 12.02.2023.
//

import Foundation

class MenuViewModel: GetMenuProtocol, ObservableObject {
        
    @Published var items: [any MenuItemProtocol] = []
    
    init() {
        fetchmenu()
    }
    
    internal func fetchmenu() {
        var menu = [any MenuItemProtocol]()
        for i in 1...12 {
            let randomNumber = Int.random(in: 3...5)
            let price = Double.random(in: 7...20)
            let orderCount = Int.random(in: 10...100)
            let ingridients: [Ingridients] = [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce]
            let ingridientsForThisFood: [Ingridients] = Array(ingridients.shuffled()[..<randomNumber])
            let item = MenuItem(title: "Food " + String(i), ingridients: ingridientsForThisFood, type: .food, price: price, ordersCount: orderCount)
            menu.append(item)
        }
        
        for i in 1...8 {
            let price = Double.random(in: 7...20).rounded()
            let orderCount = Int.random(in: 10...100)
            let ingridients: [Ingridients] = [.coffee, .water, .wine]
            let ingridientsForThisDrink: Ingridients = ingridients.shuffled()[0]
            let item = MenuItem(title: "Drink " + String(i), ingridients: [ingridientsForThisDrink], type: .drink, price: price, ordersCount: orderCount)
            menu.append(item)
        }
        
        for i in 1...4 {
            let randomNumber = Int.random(in: 3...6)
            let price = Double.random(in: 7...20).rounded()
            let orderCount = Int.random(in: 10...100)
            let ingridients: [Ingridients] = [.cheese, .coffee, .water, .flour, .milk, .sugar]
            let ingridientsForThisFood: [Ingridients] = Array(ingridients.shuffled()[..<randomNumber])
            let item = MenuItem(title: "Dessert " + String(i), ingridients: ingridientsForThisFood, type: .dessert, price: price, ordersCount: orderCount)
            menu.append(item)
        }
        
        self.items = menu
    }
}
