//
//  MenuItemDetailsView.swift
//  LittleLemonMenu
//
//  Created by Rustem Orazbayev on 11.02.2023.
//

import SwiftUI

struct MenuItemDetailsView: View {
    let foodName: String
    let foodPrice: Double
    let foodOrderedCount: Int
    let foodInggridients: [Ingridients]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200)
                    .padding()
                VStack {
                    Text("Price:")
                        .font(.system(.headline))
                    Text("$" + String(format: "%.2f", foodPrice))
                }
                .padding()
                VStack {
                    Text("Ordered:")
                        .font(.system(.headline))
                    Text(String(foodOrderedCount))
                }
                .padding()
                VStack {
                    Text("Ingridients:")
                        .font(.system(.headline))
                    ForEach(foodInggridients, id: \.self) {
                        Text(String($0.rawValue).lowercased())
                    }
                }
                .padding()
            }
            .navigationTitle(foodName)
        }
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailsView(foodName: "Pizza", foodPrice: 5.99, foodOrderedCount: 123, foodInggridients: [.sugar, .flour, .coffee])
    }
}
